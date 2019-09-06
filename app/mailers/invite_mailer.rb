# frozen_string_literal: true

class InviteMailer < ApplicationMailer
  def send_invite
    @email = params[:email]
    @password = params[:password]

    mail(to: @email, subject: 'Welcome')
  end
end
