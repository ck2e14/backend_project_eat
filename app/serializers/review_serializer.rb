class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :content, :establishment_id, :user_id
end
