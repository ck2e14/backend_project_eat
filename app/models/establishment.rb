class Establishment < ApplicationRecord
   has_many :blacklists
   has_many :reviews
   # has_many :users, through: :blacklists
   has_many :users, through: :reviews

end
