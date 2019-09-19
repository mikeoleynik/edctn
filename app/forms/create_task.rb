# frozen_string_literal: true

class CreateTask
  include ActiveModel::Model

  attr_accessor :title, :body, :difficulty, :theme_id, :picture_attributes,
                :user_tasks_attributes

  validates :title, :body, :difficulty, presence: true
  validates :difficulty, numericality: { only_integer: true, less_than_or_equal_to: 10 }

  def save
    if valid?
      task = Task.create!(title: title, body: body, difficulty: difficulty, theme_id: theme_id)
      task.create_picture(image: picture_attributes[:image]) if picture_attributes.present?
      create_user_task(task.id) if user_tasks_attributes.present?
      TaskSerializer.new(task)
    else
      { errors: ErrorSerializer.serialize(self) }
    end
  end

  def status
    @status = valid? ? :ok : :unprocessable_entity
  end

  private

  def create_user_task(task_id)
    user_tasks_attributes.each do |attribute|
      user_id = attribute['user_id']
      UserTask.create(user_id: user_id, task_id: task_id)
      TaskMailer.with(user: user_id, task: task_id).create_task.deliver_later
    end
  end
end
