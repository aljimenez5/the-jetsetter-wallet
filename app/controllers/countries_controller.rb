class CountriesController < ApplicationController
    def index
        @countries = Country.all
        # @data = File.read("#{Rails.root}/public/countriesToCities.json")
        # @data_hash = JSON.parse(@data)

        
    end 

    def new

    end

    def create

    end

    def show

    end 
end