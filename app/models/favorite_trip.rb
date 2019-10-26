class FavoriteTrip < ApplicationRecord
    belongs_to :user
    belongs_to :trip
    validates :trip_id, uniqueness: true
    
end