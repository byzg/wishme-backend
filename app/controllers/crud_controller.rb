class CrudController < ApplicationController
  before_action :check_action_inheritance
  before_action :authenticate_user!

  def index
    render_collection
  end

  def create
    model.save
    render_model
  end

  def update
    if model.persisted?
      model.update(permitted_params)
      render_model
    else
      head :not_found
    end
  end

  def destroy
    model.destroy
    render_collection
  end

  protected
  def self.actions(*actions)
    return @actions if actions.empty?
    @actions = actions
  end

  def render_model
    render json: model
  end

  def render_collection
    render json: collection
  end

  def model
    @model ||=
      collection.find_by(id: params[:id]) || collection.new(permitted_params)
  end

  def collection
    @collection ||= collection_scope
  end

  def collection_scope
    model_class.where(user_id: current_user.id)
  end

  def model_class
    model_class_name.constantize
  end

  def model_class_name
    self.class.to_s.underscore.split(/[\/_]/)[-2].singularize.capitalize
  end

  private
  def check_action_inheritance
    head :not_found if self.class.actions.exclude?(action_name.to_sym)
  end
end