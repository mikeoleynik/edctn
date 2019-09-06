# frozen_string_literal: true

class UsersController < ApplicationController
  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      render json: { success: ['User created'] }, status: :ok
    else
      render json: { error: user.errors.full_messages }, status: :internal_server_error
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
