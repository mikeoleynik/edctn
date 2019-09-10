# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!

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
