class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :city
    has_many :activities
    has_many :favorite_trips
    has_many :favorited_by, through: :favorite_trips, source: :user
    validates :name, :user_id, :city_id, :start_date, :end_date,  presence: true
    accepts_nested_attributes_for :activities
    accepts_nested_attributes_for :city, reject_if: proc {|attributes| attributes['name'].blank?}
    
    scope :city_visited, -> (city) {where("city LIKE ?", city)}

    def city_visited(city)
        where("city LIKE ?", city)
    end

    def activities_attributes=(activities_attributes)
        self.activities << Activity.find_or_create_by(name: activities_attributes[:name], description: activities_attributes[:description])
    end

    def city_attributes=(city_attributes)
        self.city = City.find_or_create_by(name: city_attributes[:name], country_id: city_attributes[:country_id])
    end

    
end