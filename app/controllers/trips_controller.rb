class TripsController < ApplicationController

    def index
        if params[:country_id] && params[:city_id]
            @trips = Trip.where(city_id: params[:city_id])
        elsif current_user && params[:user_id] == current_user.id
            @user = current_user
            @trips = current_user.trips
        elsif params[:user_id]
            @user = User.find(params[:user_id])
            @trips = @user.trips
        else
            @trips = Trip.all
        end  
    end 

    def new
        if params[:user_id] && !User.exists?(params[:user_id]) 
            flash[:notice] = "User not found."
            redirect_to users_path
        else
            @trip = Trip.new(user_id: current_user.id)
            @countries = Country.alphabetize
            @trip.build_city
            5.times { @trip.activities.build }
        end
    end

    def create
        @user = User.find_by(id: params[:trip][:user_id])
        @trip = Trip.find_by(name: params[:trip][:name], start_date: params[:trip][:start_date], end_date: params[:trip][:end_date], user_id: @user.id)
        if !@user || @user != current_user
            flash[:notice] = "Invalid User."
            redirect_to user_trips_path(current_user.id)
        elsif @trip
            flash[:notice] = "Trip already exists."
            render 'new'
        else
            @trip = Trip.new(trip_params)
            @trip.save
            redirect_to user_trip_path(current_user.id, @trip.id)
        end
    end

    def show
        @trip = Trip.find_by(id: params[:id])
    end 

    def edit
        @trip = Trip.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:user_id])
        @trip = Trip.find_by(id: params[:id])
        @trip.update(trip_params)
        redirect_to user_trip_path(current_user, @trip.id)
    end

    def destroy
        @trip = Trip.find_by(id: params[:id], user_id: current_user.id)
        @trip.delete
        redirect_to user_trips_path(current_user)
    end


    private

    def trip_params
        params.require(:trip).permit(:name, :start_date, :end_date, :user_id, city_attributes: [:country_id, :name, :id], activities_attributes: [:name, :description, :id])
    end


end