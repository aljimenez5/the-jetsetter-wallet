class TripsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
    end 

    def new
        @trip = Trip.new(user_id: params[:user_id])
    end

    def create
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
        params.require(:trip).permit(:name, :start_date, :end_date, :city_id, :user_id)
    end

end