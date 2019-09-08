# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!
  # GET /
  def homepage
    render json: { success: 'ok' }, status: :ok
  end
end
