class Transportation < ApplicationRecord
    has_and_belongs_to_many :trips
    belongs_to :city
end