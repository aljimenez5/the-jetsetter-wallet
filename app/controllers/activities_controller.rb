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
        

    end

    def show

    end 

    private

    def activity_params
        params.require(:activity).permit(:name, :description, :trip_id)
    end
end