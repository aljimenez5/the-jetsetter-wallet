class TripsController < ApplicationController


    def index
        if params[:user_id]
            @trips = User.find(params[:user_id]).trips
        else
            @trips = Trip.all
        end  
    end 

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            flash[:notice] = "User not found."
            redirect_to users_path
        else
            @trip = Trip.new(user_id: params[:user_id])
            @trip.build_city
            @trip.activities.build
        end
    end

    def create
        @user = User.find_by(id: params[:trip][:user_id])
        if !@user 
            flash[:notice] = "User not found."
        elsif @user != current_user
            flash[:notice] = "Invalid User."
        else
            @trip = Trip.create(trip_params)
            redirect_to user_trip_path(current_user, @trip.id)
        end
    end

    def show
        @trip = Trip.find_by(params[:trip_id])
    end 


    private

    def trip_params
        params.require(:trip).permit(:name, :user_id, :start_date, :end_date, city_attributes: [:country_id, :city_name], activities_attributes: [:name, :description])
    end

end