class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :city
    has_many :activities
    has_many :favorite_trips
    has_many :favorited_by, through: :favorite_trips, source: :user
    validates :name, :user_id, :city_id, :start_date, :end_date,  presence: true
    validates :name, :city_id, :start_date, :end_date, uniqueness: true
    # accepts_nested_attributes_for :activities
    accepts_nested_attributes_for :city
    
    scope :city_visited, -> (city) {where("city LIKE ?", city)}

    def city_visited(city)
        where("city LIKE ?", city)
    end

    # def activities_attributes=(activities)
    #     self.activities << Activity.find_or_create_by(name: activities[:name], description: activities[:description])
    # end

    def city_attributes=(city)
        self.city = City.find_or_create_by(name: city[:name], country_id: city[:country_id])
    end

    
end