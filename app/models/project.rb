# frozen_string_literal: true

# Projects belong to a user and validates data to the database is filled out.
class Project < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :difficulty, :duration, :tools, :parts, :location, :completion, :cost, presence: true
end
