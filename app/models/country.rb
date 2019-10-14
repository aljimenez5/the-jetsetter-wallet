class Country < ApplicationRecord
    has_many :cities
    has_many :trips, through: :cities
    has_many :lodgings, :transportations, through: :cities

end
