# Preview all emails at http://localhost:3000/rails/mailers/task_mailer
class TaskMailerPreview < ActionMailer::Preview
  def create_task
    TaskMailer.with(user: user_id, task: task_id).create_task.deliver_later
  end
end
