class WishSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :price, :updated_at
end
