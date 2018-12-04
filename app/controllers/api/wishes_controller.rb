class Api::WishesController < CrudController
  actions :index, :create, :update, :destroy

  private
  def permitted_params
    params.require(:wish).permit(:title, :text, :price)
  end

  def q_params
    params.permit(q: [:user_id])[:q]
  end

  def collection_scope
    model_class.where(q_params)
  end
end
