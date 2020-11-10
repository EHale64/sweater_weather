class Users < ApplicationRecord
  has_secure_password
  validates_presence_of :password, require: true
  validates_presence_of :password_confirmation, require: true
  validates :email, uniqueness: true, presence: true
  # validates :api_key, presence: true
  has_secure_token :api_key
end
