# frozen_string_literal: true

class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task
end
