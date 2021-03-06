# frozen_string_literal: true

class ThemesController < ApplicationController
  # POST /themes
  def create
    theme = Theme.new(theme_params)
    if theme.save
      render_success(ThemeSerializer.new(theme))
    else
      respond_with_errors(theme)
    end
  end

  # PATCH /themes/:id
  def update
    theme = Theme.find(params[:id])
    if theme.update(theme_params)
      render_success(ThemeSerializer.new(theme))
    else
      respond_with_errors(theme)
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
    params.permit(:title, nodes_attributes: %i[id task_id theme_id _destroy])
  end
end
