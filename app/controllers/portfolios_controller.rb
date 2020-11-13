class PortfoliosController < ApplicationController
	# before_action :set_portfolio

	# def index
	# 	@stock = Stock.find_by_id(params[:stock_id])
	# 	# @portfolio = Portfolio.find_by_id(params[:portfolio_id])
	# 	@portfolios = @stock.portfolios
	# 	# @stocks = @portfolio.stock
	# end

	# def show
	# 	@stock = Stock.find_by_id(params[:id])
	# 	@portfolio = Portfolio.find_by_id(params[:id])
	# end

	# def new
	# 	@portfolio = Portfolio.new
	# 	@stocks = Stock.all
	# end

	# def create
	#   @portfolio = Portfolio.new(portfolio_params)
	#   if @portfolio.save
	# 	  redirect_to portfolio_stocks_path(@portfolio)
	#   else
	# 	render :new
	#   end
	# end

	# def update
	  
	#   @portfolio.update(portfolio_params(:stock_id, :investing))
	#   redirect_to portfolios_path(@portfolio)
	# end

	# def edit
	  
	# end

	def index
		@portfolios = Portfolio.all
	end

	def show
		@portfolios = Portfolio.find_by_id(params[:id])
		# binding.pry
	end

	def new
		@portfolio = Portfolio.new
		# @stocks = Stock.all (used for checkbox option in _form which I commented out)
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
		# @stocks = Stock.all (used for checkbox option in _form which I commented out)
	  @portfolio.update(portfolio_params)
	  redirect_to portfolio_path(@portfolio)
	end

	def edit
	  set_portfolio
		# @stocks = Stock.all (used for checkbox option in _form which I commented out)
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