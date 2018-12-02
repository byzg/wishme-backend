class UserSerializer < BaseSerializer
  attributes :id, :name, :wishes_count

  def wishes_count
    object.try(:wishes_count) || object.wishes.count
  end
end
