class WishPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    !record.persisted? && record.user_id == user.id
  end

  def update?
    record.persisted? && record.user_id == user.id
  end

  def destroy?
    record.user_id == user.id
  end
end