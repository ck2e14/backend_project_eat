class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :food_concern
  has_many :reviews
  has_many :blacklists
end
