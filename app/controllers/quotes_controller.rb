class QuotesController < ApplicationController

    before_action :authenticate_user!
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

        respond_to do |format|
            if @quote.save
              format.html { redirect_to @quote, notice: 'Toy was successfully created.' }
              format.json { render :show, status: :created, location: @quote }
            else
              format.html { render :new }
              format.json { render json: @quote.errors, status: :unprocessable_entity }
            end
          end


        # if @quote.errors.any?
        #     render "new"
        # else
        #     format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        #     format.json { render :show, status: :created, location: @quote }
        # end 
    end

    def edit
        if @quote
            render "edit"
        else
            redirect_to quotes_path
        end
    end

    def update
        respond_to do |format|
            if @quote.update(quote_params)
              format.html { redirect_to @quote, notice: 'Changes successfully updated.' }
              format.json { render :show, status: :ok, location: @quote }
            else
              format.html { render :edit }
              format.json { render json: @quote.errors, status: :unprocessable_entity }
            end
          end
    end

    def destroy
        if @quote 
            @quote.destroy
            respond_to do |format|
                format.html { redirect_to quotes_path, notice: 'Quote was successfully destroyed.' }
                format.json { head :no_content }
            end
        end
    end

    private

        def set_quote
            @quote = Quote.find(params[:id])
        end

        def quote_params
            params.require(:quote).permit(:body, :author, :picture)
        end

        
end