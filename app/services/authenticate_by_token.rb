# frozen_string_literal: true

class AuthenticateByToken
  include BasicAuthenticate

  attr_reader :token

  def initialize(token)
    @token = token
  end

  def call
    user_id = decode_payload(token)
    User.find(user_id['sub'])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    raise NotAuthenticated
  end

  private

  def decode_payload(payload)
    JWT.decode(payload, secret).first
  end
end
