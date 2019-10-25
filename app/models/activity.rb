class Activity < ApplicationRecord
    belongs_to :trip
    validates :name, :description, presence: true
end