class Api::UsersController < CrudController
  actions :index

  protected
  def collection_scope
    authorized_scope
      .where.not(id: current_user.id)
      .joins('LEFT JOIN wishes ON users.id = wishes.user_id')
      .select('users.*, count(wishes.id) as wishes_count')
      .group('users.id')
  end
end
