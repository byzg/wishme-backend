class CrudController < ApplicationController
  before_action :authenticate_user!

  def index
    render_collection
  end

  def create
    render_model
  end

  def update
    model.update(permitted_params)
    render_model
  end

  def destroy
    model.destroy
    render_collection
  end

  protected
  def render_model
    render json: model
  end

  def render_collection
    render json: collection
  end

  def model
    @model ||=
      collection.find_by(id: params[:id]) || collection.create(permitted_params)
  end

  def collection
    @collection ||= model_class.where(user_id: current_user.id)
  end

  def model_class
    model_class_name.constantize
  end

  def model_class_name
    self.class.to_s.underscore.split(/[\/_]/)[-2].singularize.capitalize
  end
end