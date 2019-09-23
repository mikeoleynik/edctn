# frozen_string_literal: true

class TasksController < ApplicationController
  # POST /tasks
  def create
    task = CreateTask.new(task_params)

    render json: task.save, status: task.status
  end

  # PATCH /tasks/:id
  def update
    task = Task.find(params[:id])

    if task.update_attributes(task_params)
      render_success(TaskSerializer.new(task))
    else
      respond_with_errors(task)
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
    params.permit(:title, :body, :difficulty, picture_attributes: %i[image id _destroy],
                                              user_tasks_attributes: %i[id task_id user_id _destroy],
                                              nodes_attributes: %i[id task_id theme_id _destroy])
  end
end
