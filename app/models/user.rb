class User < ApplicationRecord
    has_secure_password
    has_many :trips
    has_many :cities, through: :trips
    has_many :favorite_trips
    has_many :favorites, through: :favorite_trips, source: :trip
    validates :username, :email, presence: true, uniqueness: true
    validates :email, :password, confirmation: true, format: { with: /[a-zA-Z0-9@!#$%&*_-]/}
    
end