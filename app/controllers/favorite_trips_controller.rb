class FavoriteTripsController < ApplicationController

    def index
        @user_favorites = current_user.favorite_trips
    end

    def create
        if current_user
            @favorite = FavoriteTrip.create(favorite_trip_params)
            redirect_to user_favorite_trips_path(current_user)
        else
            flash[:notice] = "You must be logged in to save to favorites."
            redirect_to log_in_path  
        end
    end

    def destroy
        @favorite = FavoriteTrip.find_by(trip_id: params[:trip_id], user_id: current_user)
        @favorite.delete
        redirect_to user_favorite_trips_path(current_user)
    end

    private

    def favorite_trip_params
        params.permit(:user_id, :trip_id)
    end
end