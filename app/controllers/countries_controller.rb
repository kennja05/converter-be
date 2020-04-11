require 'dotenv'
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
        from = params['from']
        to = params['to']
        amount = params['amount']
        byebug
        amt = JSON.parse(RestClient.get("https://data.fixer.io/api/convert?access_key=7565a1db44ef9053cc4d95b8ac794ffc&from=GBP&to=JPY&amount=25"))
        
        render json: amt
    end 

end
