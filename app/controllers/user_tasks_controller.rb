# frozen_string_literal: true

class UserTasksController < ApplicationController
  # POST /user_tasks
  def create
    user_task = UserTask.new(user_tasks_params)

    if user_task.save
      render_success(UserTaskSerializer.new(user_task))
    else
      render_errors(user_task)
    end
  end

  private

  def user_tasks_params
    params.permit(:user_id, :task_id)
  end
end
