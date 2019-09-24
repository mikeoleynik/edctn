# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :text             not null
#  difficulty :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ApplicationRecord
  has_one :picture, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  has_many :nodes, dependent: :destroy
  has_many :themes, through: :nodes

  validates :title, :body, :difficulty, presence: true
  validates :difficulty, numericality: { only_integer: true, less_than_or_equal_to: 10 }

  accepts_nested_attributes_for :picture
  accepts_nested_attributes_for :user_tasks
  accepts_nested_attributes_for :nodes
end
