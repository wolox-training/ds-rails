class User < ApplicationRecord
  has_many :rents, dependent: :destroy

  extend Devise::Models
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
