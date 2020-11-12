class WatchListsController < ApplicationController
	before_action :set_watch_list
	
	def index
		@watch_lists = WatchList.all
	end

	def show
		@watch_lists = WatchList.find_by_id(params[:id])
	end

	def new
		@watch_list = WatchList.new
	end

	def create
	  @watch_list = WatchList.new(watch_list_params)
	  @watch_list.user = current_user
	  if @watch_list.save
		redirect_to watch_list_path(@watch_list)
	  else
		render :new
	  end
	end


	def update
	  set_watch_list
	  @watch_list.update(watch_list_params)
	  redirect_to watch_list_path(@watch_list)
	end

	def edit
	  set_watch_list
	  if !@watch_list
		redirect_to watch_lists_path
	  end
	end

	def destroy
		@watch_list.destroy
		redirect_to watch_lists_path
	end

private
	def set_watch_list
		@watch_list = WatchList.find_by_id(params[:id])
	end

	def watch_list_params
		params.require(:watch_list).permit(:list_name, :user_id, stocks_attributes:[:id, :name, :ticker, :value, :_destroy]) 
	end
end
