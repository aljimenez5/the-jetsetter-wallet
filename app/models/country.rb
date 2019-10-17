class Country < ApplicationRecord
    has_many :cities
    has_many :trips, through: :cities
    validates :name, presence: true, uniqueness: true
    
    default_scope { order(name: :desc) }
end
