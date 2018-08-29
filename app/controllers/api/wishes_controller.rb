class Api::WishesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.wishes
  end
end
