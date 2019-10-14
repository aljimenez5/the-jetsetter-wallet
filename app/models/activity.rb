class Activity < ActiveRecord
    belongs_to :city
    belongs_to :trip
end