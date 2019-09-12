# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :theme

  has_one :picture, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks

  validates :title, :body, :difficulty, presence: true
  validates :difficulty, numericality: { only_integer: true, less_than_or_equal_to: 10 }

  accepts_nested_attributes_for :picture
  accepts_nested_attributes_for :user_tasks
end
