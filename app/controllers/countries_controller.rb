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

end
