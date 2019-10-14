class Trip < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :cities
    has_and_belongs_to_many :lodgings
    has_and_belongs_to_many :transportations
    has_many :favorite_trips
    has_many :favorited_by, through: :favorite_trips, source: :user
    
    scope :city_visited, -> (city) {where("city LIKE ?", city)}

    def city_visited(city)
        where("city LIKE ?", city)
    end
end