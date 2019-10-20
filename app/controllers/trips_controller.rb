class TripsController < ApplicationController
    def index
        if params[:user_id]
            @trips = User.find(params[:user_id]).trips
        else
            @trips = Trip.all
        end  
    end 

    def new
        @trip = Trip.new(user_id: params[:user_id])
        @trip.build_city
        @trip.activities.build
    end

    def create
        raise params
        @trip = Trip.find_by(name: params[:trip][:name], user_id: params[:user_id])
        @country = Country.find_by(name: params[:trip][:country][:name])
        @city = City.find_by(name: params[:trip][:city][:name])
        if @trip
            flash[:notice] = "You already have a trip with this name."
        else
            

            @trip = Trip.create(trip_params)
        end 
    end

    def show

    end 


    private

    def trip_params
        params.require(:trip).permit(:name, :user_id, :start_date, :end_date, city_attributes: [:country_id, :city_name], activities_attributes: [:name, :description])
    end

end