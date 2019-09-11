# frozen_string_literal: true

class TaskSerializer < BaseSerializer
  attributes :title, :body, :difficulty, :theme_id
end
