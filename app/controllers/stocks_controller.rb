class StocksController < ApplicationController
	def index
		@stocks = Stock.all
	end

	def show
		@stock = Stock.find_by_id(params[:id])
	end

	def new
		@stock = Stock.new
	end

	def create
	  @stock = Stock.new(stock_params(:name, :ticker, :open, :value))
		if @stock.save 
			redirect_to stocks_path(@stock)
		else
			render :new
		end
	end

	def update
	  @stock = Stock.find_by_id(params[:id])
	  @stock.update(stock_params)
	  redirect_to stock_path(@stock)
	end

	def edit
	  @stock = Stock.find_by_id(params[:id])
	end

	def destroy
		binding.pry
		@stock = Stock.find_by_id(params[:id])
		if @stock.present?
			@stock.destroy
		end
		redirect_to watch_list_stock_path(@stock)
	end

private
	def stock_params(*args)
		params.require(:stock).permit(*args)
	end

	
end