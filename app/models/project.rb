# frozen_string_literal: true

class Project < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, :difficulty, :duration, :tools, :parts, :location, :completion, :cost, presence: true
end
