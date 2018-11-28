class Api::UsersController < CrudController
  actions :index

  protected
  def collection_scope
    User
      .joins('LEFT JOIN wishes ON users.id = wishes.user_id')
      .select('users.*, count(wishes.id) as wish_count')
      .group('users.id')
      .where.not(id: current_user.id)
  end
end
