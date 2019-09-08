# frozen_string_literal: true

class UsersController < ApplicationController
  # POST /users
  def create
    User.invite!(email: 'new_user@example.com', fullname: 'John Doe')
    render json: { success: 'invite sent' }, status: :ok
  end
end
