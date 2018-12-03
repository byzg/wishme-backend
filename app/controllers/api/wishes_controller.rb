class Api::WishesController < CrudController
  actions :index, :create, :update, :destroy

  private
  def permitted_params
    params.require(:wish).permit(:title, :text, :price)
  end

  def collection_scope
    model_class.where(user_id: params[:user_id])
  end
end
