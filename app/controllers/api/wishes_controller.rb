class Api::WishesController < CrudController
  private
  def permitted_params
    params.require(:wish).permit(:title, :text, :price)
  end
end
