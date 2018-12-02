# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true

  has_many :wishes, dependent: :destroy

  def token_validation_response
    UserSerializer.new(self).attributes
  end
end
