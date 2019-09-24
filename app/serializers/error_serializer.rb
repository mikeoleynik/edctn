# frozen_string_literal: true

class ErrorSerializer
  def self.serialize(object)
    object.errors.messages.map do |field, errors|
      errors.map do |error_message|
        {
          status: 422,
          source: { pointer: "/data/attributes/#{field}" },
          detail: error_message
        }
      end
    end.flatten
  end
end
