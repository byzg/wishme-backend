class WishSerializer < BaseSerializer
  attributes :id, :title, :text, :price, :updated_at, :user_id
end
