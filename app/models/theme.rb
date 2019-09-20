# frozen_string_literal: true

class Theme < ApplicationRecord
  has_many :nodes, dependent: :destroy
  has_many :tasks, through: :nodes

  validates :title, presence: true

  accepts_nested_attributes_for :nodes
end
