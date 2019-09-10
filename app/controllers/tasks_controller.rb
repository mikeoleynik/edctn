# frozen_string_literal: true

class TasksController < ApplicationController
  # POST /tasks
  def create
    task = Task.new(task_params)
    if task.save
      render_success(task)
    else
      render_errors(task)
    end
  end

  private

  def task_params
    params.permit(:title, :body, :difficulty, :theme_id)
  end

  def render_success(task)
    render json: TaskSerializer.new(task).serialized_json, status: :ok
  end

  def render_errors(task)
    render json: wrong_attribute(task.errors.full_messages), status: :unprocessable_entity
  end
end
