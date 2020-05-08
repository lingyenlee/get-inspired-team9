class GeneratorsController < ApplicationController
    layout "generator"
    def new
        all_quotes = getData
        @qod = all_quotes.sample
        puts @qod
        # puts "generate"
        #  url = "https://quotes.rest/qod?language=en"
        # response = RestClient.get(url)
        # @qod = JSON.parse(response.body)
        # puts @qod
    end

    private
        def getData
            response = ::RestClient::Request.execute(method: :get, url: "https://type.fit/api/quotes", headers: {"content_type" => "application/json"})
            JSON.parse(response.body)
        end
end