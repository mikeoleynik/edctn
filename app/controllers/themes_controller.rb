# frozen_string_literal: true

class ThemesController < ApplicationController
  # POST /themes
  def create
    theme = Theme.new(theme_params)
    if theme.save
      render_success(ThemeSerializer.new(theme))
    else
      render_errors(theme)
    end
  end

  # PATCH /themes/:id
  def update
    theme = Theme.find(params[:id])
    if theme.update_attributes(theme_params)
      render_success(ThemeSerializer.new(theme))
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
end
