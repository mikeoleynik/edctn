# frozen_string_literal: true

class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  after_commit :create_task

  private

  def create_task
    TaskMailer.with(user: user_id, task: task_id).create_task.deliver_later
  end
end
