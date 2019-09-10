# frozen_string_literal: true

class ThemesController < ApplicationController
  # GET /
  def create
    theme = Theme.new(theme_params)
    if theme.save
      render json: ThemeSerializer.new(theme), status: :ok
    else
      render json: wrong_attribute(theme.errors.full_messages), status: :unprocessable_entity
    end
  end

  private

  def theme_params
    params.permit(:title)
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
