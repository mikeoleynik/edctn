# frozen_string_literal: true

module BasicAuthenticate
  class NotAuthenticated < StandardError; end

  private

  def secret
    @secret = Rails.application.secrets.secret_key_base
  end
end
