class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :city
    has_many :activities
    has_many :favorite_trips
    has_many :favorited_by, through: :favorite_trips, source: :user
    validates :name, :user_id, :city_id, :start_date, :end_date,  presence: true
    validates :name, uniqueness: true

    
    def activities_attributes=(activities_attributes)
        activities_attributes.values.each do |activity|
            if activity[:id]
                act = Activity.find_by(id: activity[:id])
                act.update(name: activity[:name], description: activity[:description]) unless activity[:name].blank? || activity[:description].blank?
            else
                act = Activity.find_or_create_by(name: activity[:name], description: activity[:description])
                self.activities << act unless act[:name].blank? || act[:description].blank?
            end
        end
    end

    def city_attributes=(city_attributes)
        self.city = City.find_or_create_by(name: city_attributes[:name], country_id: city_attributes[:country_id])
    end
    
end