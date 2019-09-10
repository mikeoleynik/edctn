# frozen_string_literal: true

class Theme < ApplicationRecord
  validates :title, presence: true
end
