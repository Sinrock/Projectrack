# frozen_string_literal: true

# Project
class Project < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :completion, presence: true
end
