# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from BasicAuthenticate::NotAuthenticated, with: :not_authenticated

  private

  def authorize!
    AuthenticateByToken.new(request.headers['Authorization']).call
  end

  def not_authenticated
    render json: { error: 'Not Authenticated' }, status: :unauthorized
  end
end
