class PortfoliosController < ApplicationController

	def index
		@portfolios = Portfolio.all
	end

	def show
		@portfolios = Portfolio.find_by_id(params[:id])
	end

	def new
		@portfolio = Portfolio.new
		
	end

	def create
	  @portfolio = Portfolio.new(portfolio_params)
	  @portfolio.user = current_user
	  if @portfolio.save
		redirect_to portfolio_path(@portfolio)
	  else
		render :new
	  end
	end

	def update
	  set_portfolio
	  @portfolio.update(portfolio_params)
	  redirect_to portfolio_path(@portfolio)
	end

	def edit
	  set_portfolio
	  if !@portfolio
		redirect_to portfolio_path
	  end
	end

private
	def set_portfolio
		@portfolio = Portfolio.find_by_id(params[:id])
	end

	def portfolio_params
		params.require(:portfolio).permit(:investing, :user_id, stocks_attributes:[:id, :name, :ticker, :value]) 
	end
end