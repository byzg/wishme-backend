class Api::WishesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.wishes
  end

  def create
    wish = current_user.wishes.create(wish_params)
    render json: wish
  end

  private
  def wish_params
    params.require(:wish).permit(:title, :text, :price)
  end
end
