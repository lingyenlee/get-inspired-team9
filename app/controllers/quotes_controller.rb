class QuotesController < ApplicationController
    def index
        @quotes = Quote.all
    end

    def show
        @quote = Quote.find(params[:id]) 
    end

    def new
        @quote = Quote.new
    end

    def create
        @quote = current_user.quotes.create(quote_params)
        redirect_to quotes_path
    end

    def edit
        @quote = Quote.find(params[:id])
    end


    private
        def quote_params
            params.require(:quote).permit(:body, :author, :picture)
        end
end