# frozen_string_literal: true

class ThemesController < ApplicationController
  # POST /themes
  def create
    theme = Theme.new(theme_params)
    if theme.save
      render_success(theme)
    else
      render_errors(theme)
    end
  end

  # PATCH /themes/:id
  def update
    theme = Theme.find(params[:id])
    if theme.update_attributes(theme_params)
      render_success(theme)
    else
      render_errors(theme)
    end
  end

  # DELETE /themes/:id
  def destroy
    theme = Theme.find(params[:id])
    theme.destroy
    render json: {}, status: :no_content
  end

  private

  def theme_params
    params.permit(:title)
  end

  def render_success(theme)
    render json: ThemeSerializer.new(theme), status: :ok
  end

  def render_errors(theme)
    render json: wrong_attribute(theme.errors.full_messages), status: :unprocessable_entity
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
