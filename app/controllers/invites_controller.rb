# frozen_string_literal: true

class InvitesController < ApplicationController
  before_action :authenticate_user!

  # GET /invite
  def invite
    User.invite!(email: 'new_user@example.com', fullname: 'John Doe')
    render json: { success: 'invite sent' }, status: :ok
  end
end
