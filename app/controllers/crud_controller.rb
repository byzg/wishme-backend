class CrudController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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
    model.update(permitted_params)
    render_model
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
    return @model if @model
    @model =
      authorized_scope.find_by(id: params[:id]) || authorized_scope.new(permitted_params)
    authorize @model
    @model
  end

  def collection
    @collection ||= collection_scope
  end

  def collection_scope
    raise NotImplementedError
  end

  def authorized_scope
    policy_scope(model_class_name.constantize)
  end

  def model_class_name
    self.class.to_s.underscore.split(/[\/_]/)[-2].singularize.capitalize
  end

  private
  def user_not_authorized
    head :forbidden
  end

  def check_action_inheritance
    head :not_found if self.class.actions.exclude?(action_name.to_sym)
  end
end