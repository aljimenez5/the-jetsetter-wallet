class CountriesController < ApplicationController
    def index
        @countries = Country.order(:name)
    end 

    def new

    end

    def create

    end

    def show

    end 
end