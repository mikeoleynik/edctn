# frozen_string_literal: true

class Node < ApplicationRecord
  belongs_to :theme
  belongs_to :task
end
