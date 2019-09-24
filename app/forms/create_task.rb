# frozen_string_literal: true

# FormObject to create task and nested object.
# Associate tasks with users, themes, and picture.

class CreateTask
  include ActiveModel::Model

  attr_accessor :title, :body, :difficulty, :picture_attributes, :user_tasks_attributes, :nodes_attributes

  validates :title, :body, :difficulty, presence: true
  validates :difficulty, numericality: { only_integer: true, less_than_or_equal_to: 10 }

  # Creates a Task and associate it with a user, theme, and image
  # Returns JSON API response for Task (:title, :body, :difficulty)
  def save
    if valid?
      task = Task.create!(title: title, body: body, difficulty: difficulty)
      create_association_for(task)
      TaskSerializer.new(task)
    else
      { errors: ErrorSerializer.serialize(self) }
    end
  end

  # Return status 200 when task valid or 422 when not valid
  def status
    @status = valid? ? :ok : :unprocessable_entity
  end

  private

  # Creates associate for Task
  def create_association_for(task)
    task.create_picture(image: picture_attributes[:image]) if picture_attributes.present?
    create_nodes(task.id) if nodes_attributes.present?
    create_user_tasks(task.id) if user_tasks_attributes.present?
  end

  # Creates associate with User
  def create_user_tasks(task_id)
    user_tasks_attributes.each do |attribute|
      user_id = attribute['user_id']
      UserTask.create!(user_id: user_id, task_id: task_id)
      TaskMailer.with(user: user_id, task: task_id).create_task.deliver_later
    end
  end

  # Creates associate with Theme
  def create_nodes(task_id)
    nodes_attributes.each do |attribute|
      theme_id = attribute['theme_id']
      Node.create!(theme_id: theme_id, task_id: task_id)
    end
  end
end
