class WishSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :price
end
