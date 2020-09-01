class StocksController < ApplicationController

    def index
        @client = Stock.all.new_request
        
    end

    def new
        @stock = Stock.new
    end

    def show
        @stock = Stock.find(params[:id])
    end

    def create
    end

    def update
    end

    def edit
    end

end
