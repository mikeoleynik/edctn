# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :theme

  validates :title, :body, :difficulty, presence: true
  validates :difficulty, numericality: { only_integer: true, less_than_or_equal_to: 10 }
end
