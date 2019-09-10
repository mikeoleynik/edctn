# frozen_string_literal: true

class ThemeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title
end
