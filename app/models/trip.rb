class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :city
    has_many :activities
    has_many :favorite_trips
    has_many :favorited_by, through: :favorite_trips, source: :user
    
    scope :city_visited, -> (city) {where("city LIKE ?", city)}

    def city_visited(city)
        where("city LIKE ?", city)
    end
end