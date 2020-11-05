class WatchListsController < ApplicationController
	before_action :set_watch_list
	
	def index
		@watch_lists = WatchList.all
	end

	def show
		@watch_lists = WatchList.find(params[:id])
	end

	def new
		@watch_list = WatchList.new
	end

	def create
	#   @watch_list = WatchList.new(watch_list_params(:list_name, :user_id, :stock_id))
	  @watch_list = WatchList.new(watch_list_params)
	  @watch_list.user = current_user
	#   binding.pry
	  if @watch_list.save
		redirect_to watch_list_path(@watch_list)
	  else
		render :new
		# binding.pry
		5.times {@watch_list.stocks.build}
	  end
	end


	def update
	  @watch_list = WatchList.find(params[:id])
	  @watch_list.update(watch_list_params(:list_name))
	  redirect_to watch_list_path(@watch_list)
	end

	def edit
	  @watch_list = WatchList.find(params[:id])
	end

private
	def set_watch_list
		@watch_list = WatchList.find_by_id(params[:id])
	end

	def watch_list_params
		params.require(:watch_list).permit(:list_name, :user_id, :stock_id, stocks_attributes:[:name, :ticker, :value].push(:_destroy)) 
	end
end
