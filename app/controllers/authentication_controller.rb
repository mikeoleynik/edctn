# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def create
    token = GetToken.new(email: params[:email], password: params[:password]).call
    render json: { auth_token: token }, status: :ok
  end
end
