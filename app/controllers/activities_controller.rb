class ActivitiesController < ApplicationController
    def index

    end 

    def new
        @user = User.find_by(id: params[:user_id])
        @trip = Trip.find_by(id: params[:trip_id])
        if !@user
            flash[:notice] = "User not found."
            redirect_to users_path
        elsif !@trip
            flash[:notice] = "Trip not found."
            redirect_to trips_path
        else
            @activity = Activity.new(trip_id: @trip.id)
        end
    end

    def create
        @user = User.find_by(id: params[:user_id])
        @trip = Trip.find_by(id: params[:trip_id])
        @activity = Activity.find_by(name: params[:activity][:name], trip_id: @trip.id)
        if !@user || @user != current_user
            flash[:notice] = "Invalid User."
            redirect_to user_trips_path(current_user)
        elsif @activity
            flash[:notice] = "Activity already exists."
            redirect_to new_user_trip_activity_path(current_user)
        else
            @activity = Activity.new(activity_params)
            @activity.trip_id = @trip.id
            @activity.save
            redirect_to user_trip_path(current_user, @trip.id)
        end

    end

    def destroy
        @trip = Trip.find_by(id: params[:trip_id], user_id: current_user.id)
        @activity = Activity.find_by(id: params[:id], trip_id: @trip.id)
        @activity.delete
        redirect_to user_trip_path(current_user, @trip.id)
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :description)
    end
end