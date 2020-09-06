class WatchListsController < ApplicationController
	def index
		@watch_lists = WatchList.all
	end

	def show
		@watch_list = WatchList.find(params[:id])
	end

	def new
		@watch_list = WatchList.new
	end

	def create
	  @watch_list = WatchList.new(watch_list_params(:list_name, :user_id, :stock_id))
	  @watch_list.save
	  redirect_to watch_list_path(@watch_list)
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
	def watch_list_params(*args)
		params.require(:watch_list).permit(*args)
	end
end
