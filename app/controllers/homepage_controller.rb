class HomepageController < ApplicationController

    def index
        @trips = Trip.all
    end
end