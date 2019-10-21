class FavoriteTrip < ApplicationRecord
    belongs_to :user
    belongs_to :trip
    validates :user_id, :trip_id, uniqueness: true
    
end