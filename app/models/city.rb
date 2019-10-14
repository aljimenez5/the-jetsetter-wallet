class City < ApplicationRecord
    belongs_to :country
    has_many :transportations, :lodgings
    has_and_belongs_to_many :trips
    

end