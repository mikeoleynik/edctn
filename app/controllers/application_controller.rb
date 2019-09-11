# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def render_success(serializer)
    render json: serializer.serialized_json, status: :ok
  end

  def render_errors(task)
    render json: wrong_attribute(task.errors.full_messages), status: :unprocessable_entity
  end

  def wrong_attribute(errors)
    {
      "errors": [
        {
          "status": '422',
          "detail": errors
        }
      ]
    }
  end
end
