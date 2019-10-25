class CitiesController < ApplicationController
    def index
        @cities = City.all
    end 

    def new

    end
    
    def show
        @city = City.find_by(id: params[:id])
    end 
end