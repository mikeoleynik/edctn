# frozen_string_literal: true

class Theme < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
end
