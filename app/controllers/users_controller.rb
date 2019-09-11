# frozen_string_literal: true

class UsersController < ApplicationController
  # POST /users
  def create
    user = User.invite!(email: 'new_user@example.com', fullname: 'John Doe')
    render_success(UserSerializer.new(user))
  end
end
