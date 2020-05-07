class QuotesController < ApplicationController

    before_action :set_quote, only: [:show, :edit, :update, :destroy ]

    def index
        @quotes = Quote.all
    end

    def show
    end

    def new
        @quote = Quote.new
        
    end

    def create
        @quote = current_user.quotes.create(quote_params)

        if @quote.errors.any?
            render "new"
        else
            redirect_to quotes_path
        end 
    end

    def edit
       
        if @quote
            render "edit"
        else
            redirect_to quotes_path
        end
    end

    def update
       
        if @quote
            @updated_quote = Quote.update(quote_params)
            if @quote.errors.any?
                render "edit"
            else
                redirect_to quotes_path
            end 
        else 
            redirect_to quotes_path
        end
    end

    def destroy
        if @quote 
            @quote.destroy
        end
        
        redirect_to quotes_path
    end

    private

        def set_quote
            @quote = Quote.find(params[:id])
        end

        def quote_params
            params.require(:quote).permit(:body, :author, :picture)
        end

        
end