# frozen_string_literal: true

# == Schema Information
#
# Table name: themes
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Theme < ApplicationRecord
  has_many :nodes, dependent: :destroy
  has_many :tasks, through: :nodes

  validates :title, presence: true

  accepts_nested_attributes_for :nodes
end
