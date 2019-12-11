class User < ApplicationRecord
   has_secure_password
   validates :username, uniqueness: { case_sensitive: false }
   has_many :reviews
   # has_many :establishments, through: :reviews ***IS THIS A NECESSARY ASSOCIATION?****
   has_many :blacklists

end
