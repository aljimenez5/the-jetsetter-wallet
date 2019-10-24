class City < ApplicationRecord
    belongs_to :country
    has_many :trips
    has_many :activities, through: :trips
    has_many :users, through: :trips
    validates :name, :country_id, presence: true, uniqueness: true
end