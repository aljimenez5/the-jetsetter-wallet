class City < ApplicationRecord
    belongs_to :country
    has_many :trips
    has_many :activities
    has_many :users, through: :trips
    validates :name, presence: true, uniqueness: true
end