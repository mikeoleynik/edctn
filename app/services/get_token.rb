# frozen_string_literal: true

class GetToken
  include BasicAuthenticate

  attr_reader :email, :password

  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def call
    user = User.find_by(email: email)
    if user&.authenticate(password)
      payload = { 'sub' => user.id }
      encode_payload(payload)
    else
      raise NotAuthenticated
    end
  end

  private

  def encode_payload(payload)
    JWT.encode(payload, secret)
  end
end
