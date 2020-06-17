# require 'dotenv'
require 'rest-client'

class CountriesController < ApplicationController

    def index
        countries = Country.all 
        render json: countries 
    end

    def codeShow
        code = params['code'].upcase
        countries = Country.all.where(currency_code: code)
        render json: countries
    end

    def convert
        key = ENV['CONVERSION_API_KEY']
        from = params['from']
        to = params['to']
        amount = params['amount']
        result = JSON.parse(RestClient.get("https://data.fixer.io/api/convert?access_key=#{key}&from=#{from}&to=#{to}&amount=#{amount}"))
        render json: result
    end 

    def historicalRates
        key = ENV['CONVERSION_API_KEY']
        myArr = []
        base = params['base']
        symbol = params['symbol']
        i = 0
        while i < 5 do 
            startDate = params['start_date']
            dateToArr = startDate.split('-')
            neededYear = dateToArr[0].to_i - i
            dateToArr[0] = neededYear
            pastDate = dateToArr.join('-')
            result = JSON.parse(RestClient.get("https://data.fixer.io/api/#{pastDate}?access_key=#{key}&symbols=#{symbol}&base=#{base}"))
            myArr.push(result)        
            i+=1
        end 
        render json: myArr
    end


end
