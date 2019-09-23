# frozen_string_literal: true

class TaskMailer < ApplicationMailer
  def create_task
    email = User.find(params[:user]).email
    @task = Task.find(params[:task]).title

    mail(to: email, subject: t(:subject, scope: %i[mailers task create_task]))
  end
end
