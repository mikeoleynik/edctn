# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def render_success(serializer)
    render json: serializer.serialized_json, status: :ok
  end

  def respond_with_errors(object)
    render json: {errors: ErrorSerializer.serialize(object)}, status: :unprocessable_entity
  end
end
