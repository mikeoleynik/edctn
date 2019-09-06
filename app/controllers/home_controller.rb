# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authorize!
  # GET /
  def homepage
    render json: { success: 'ok' }, status: :ok
  end
end
