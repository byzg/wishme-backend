class Api::WishesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: collection
  end

  def create
    wish = collection.create(wish_params)
    render json: wish
  end

  def update
    wish = collection.find(params[:id])
    wish.update(wish_params)
    render json: wish
  end

  private
  def wish_params
    params.require(:wish).permit(:title, :text, :price)
  end

  def collection
    current_user.wishes
  end
end
