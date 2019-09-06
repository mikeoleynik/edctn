# frozen_string_literal: true

class InvitesController < ApplicationController
  before_action :authorize!
  # GET /send_invite
  def send_invite
    prefix = SecureRandom.hex(3)
    InviteMailer.with(email: "#{prefix}-student@qwerty.ru", password: 'qwerty').send_invite.deliver_later
    render json: { success: 'invite sent' }, status: :ok
  end
end
