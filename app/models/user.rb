class User < ApplicationRecord
    has_secure_password
    has_many :trips
    has_many :cities, through: :trips
    has_many :favorite_trips
    has_many :favorites, through: :favorite_trips, source: :trip
    validates :username, :email, presence: true, uniqueness: true
    validates :email, :password, confirmation: true, format: { with: /[a-zA-Z0-9@!#$%&*_-]/}
    

    def have_favorite?(trip)
        self.favorites.include?(trip)
    end

    def favorite_found(trip)
        FavoriteTrip.find_by(trip_id: trip.id, user_id: self.id)
    end
end