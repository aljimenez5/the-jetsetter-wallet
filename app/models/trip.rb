class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :city
    has_many :activities
    has_many :favorite_trips
    has_many :favorited_by, through: :favorite_trips, source: :user
    validates :name, :user_id, :city_id, :start_date, :end_date,  presence: true
    validates :name, :city_id, :start_date, :end_date, uniqueness: true
    
    scope :city_visited, -> (city) {where("city LIKE ?", city)}

    def city_visited(city)
        where("city LIKE ?", city)
    end

    def activities_attributes=(activities_attributes)
        activities_attributes.values.each do |activity|
            act = Activity.find_or_create_by(name: activity[:name], description: activity[:description])
            self.activities << act if !act[:name].blank?
        end
    end

    def city_attributes=(city_attributes)
        self.city = City.find_or_create_by(name: city_attributes[:name], country_id: city_attributes[:country_id])
        self.city.update(city_attributes)
    end
    
end