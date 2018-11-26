class Api::UsersController < CrudController
  actions :index

  protected
  def collection_scope
    User.where.not(user_id: current_user.id)
  end
end
