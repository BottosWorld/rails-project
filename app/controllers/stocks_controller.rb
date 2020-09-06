class StocksController < ApplicationController
	def index
		@stocks = Stock.all
	end

	def show
		@stock = Stock.find(params[:id])
	end

	def new
		@stock = Stock.new
	end

	def create
	  @stock = Stock.new(stock_params(:name, :ticker, :open, :value))
	  @stock.save
	  redirect_to stock_path(@stock)
	end

	def update
	  @stock = Stock.find(params[:id])
	  @stock.update(stock_params(:value))
	  redirect_to stock_path(@stock)
	end

	def edit
	  @stock = Stock.find(params[:id])
	end

private
	def stock_params(*args)
		params.require(:stock).permit(*args)
	end
end