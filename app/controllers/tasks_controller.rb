# frozen_string_literal: true

class TasksController < ApplicationController
  # POST /tasks
  def create
    task = Task.new(task_params)

    if task.save
      render_success(TaskSerializer.new(task))
    else
      render_errors(task)
    end
  end

  # PATCH /tasks/:id
  def update
    task = Task.find(params[:id])

    if task.update_attributes(task_params)
      render_success(TaskSerializer.new(task))
    else
      render_errors(task)
    end
  end

  # DELETE /tasks/:id
  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: {}, status: :no_content
  end

  private

  def task_params
    params.permit(:title, :body, :difficulty, :theme_id, picture_attributes: %i[image id _destroy],
                                                         user_tasks_attributes: %i[id task_id user_id _destroy])
  end
end
