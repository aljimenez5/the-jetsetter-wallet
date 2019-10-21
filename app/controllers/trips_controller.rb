class TripsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]

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
            @trip = Trip.new(trip_params)
            # @trip.save
            if !@trip.valid?
                flash[:notice] = "Fields cannot be empty."
                render 'new'
            else
                redirect_to user_trip_path(current_user, @trip.id)
            end
        end
    end

    def show
        @trip = Trip.find_by(id: params[:id])
    end 

    def edit
        @trip = Trip.find_by(id: params[:id])
    end

    def update

    end


    private

    def trip_params
        params.require(:trip).permit(:name, :start_date, :end_date, :user_id, city_attributes: [:country_id, :name], activities_attributes: [:name, :description])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end