class PortfoliosController < ApplicationController
	# def index
	# 	@portfolio = Portfolio.all
	# end

	def show
		@portfolio = Portfolio.find(params[:id])
	end

	def new
		@portfolio = Portfolio.new
	end

	def create
	  @portfolio = Portfolio.new(portfolio_params(:investing, :user_id, :stock_id))
	#   byebug
	  if @portfolio.save
		  redirect_to portfolio_stocks_path(@portfolio)
	  else
		render :new
	  end
	end

	def update
	  @portfolio = Portfolio.find(params[:id])
	  @portfolio.update(portfolio_params(:stock_id, :investing))
	  redirect_to portfolios_path(@portfolio)
	end

	def edit
	  @portfolio = Portfolio.find(params[:id])
	end

private
	def portfolio_params(*args)
		params.require(:portfolio).permit(*args)
	end
end