# frozen_string_literal: true

class HomeController < ApplicationController
  # GET /
  def homepage
    render json: { success: 'ok' }, status: :ok
  end
end
