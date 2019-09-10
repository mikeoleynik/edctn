class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :body, :difficulty, :theme_id
end
