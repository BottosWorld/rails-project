class StocksController < ApplicationController
	def index
		if params[:watch_list_id]
			set_watch_list
			@stocks = @watch_list.stocks
		elsif params[:portfolio_id]
			set_portfolio
			@stocks = @portfolio.stocks
		else
			@stocks = Stock.all
			@elite_stocks = Stock.elite_stocks
		end
	end

	def show
		# @stock = Stock.find_by_id(params[:id])
		if params[:watch_list_id]
			set_watch_list
			@stocks = @watch_list.stocks
		elsif params[:portfolio_id]
			set_portfolio
			@stocks = @portfolio.stocks
		else
			@stocks = Stock.all
		end
	end

	def new
		@stock = Stock.new
	end

	def create
	  @stock = Stock.new(stock_params)
		if @stock.save 
			redirect_to stocks_path(@stock)
		else
			render :new
		end
	end

	def update
	  set_stock
	  set_watch_list
	  set_portfolio
	  if params[:watch_list_id]
		
		@stock.update(stock_params)
		redirect_to watch_list_stock_path(@watch_list)
	  elsif params[:portfolio_id]
		
		@stock.update(stock_params)
		redirect_to portfolio_path(@portfolio)
	  else
		@stock.update(stock_params)
		redirect_to stocks_path(@stock)
	  end
	end

	def edit
	  set_stock
	  set_watch_list
	  set_portfolio
	end

	def destroy
		set_stock
		if @stock.present?
			@stock.destroy
		end
		redirect_to watch_list_stock_path(@stock)
	end

private

	def set_stock
		@stock = Stock.find_by_id(params[:id])
	end

	def set_watch_list
		@watch_list = WatchList.find_by_id(params[:watch_list_id])
	end

	def set_portfolio
		@portfolio = Portfolio.find_by_id(params[:portfolio_id])
	end

	def stock_params
		params.require(:stock).permit(:name, :ticker, :value, :watch_list_id, :portfolio_id)
	end

	
end