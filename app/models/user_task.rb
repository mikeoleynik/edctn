# frozen_string_literal: true

class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :user_id, uniqueness: { scope: :task_id,
                                    message: 'The student is already doing this task' }
end
