# frozen_string_literal: true

# User
class User < ActiveRecord::Base
  has_many :projects
  has_secure_password
  validates :email, :name, :password, presence: true
  validates :email, uniqueness: true
end
