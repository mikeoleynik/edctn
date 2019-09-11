# frozen_string_literal: true

class UserTaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :task_id
end
