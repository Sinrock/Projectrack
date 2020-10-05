# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :projects
  has_secure_password
  validates :email, :password, :presence => true
  validates :email, :uniqueness => true
end
