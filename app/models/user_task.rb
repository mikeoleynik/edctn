# frozen_string_literal: true

# Join table for User and Task

# == Schema Information
#
# Table name: user_tasks
#
#  id      :bigint           not null, primary key
#  user_id :bigint           not null
#  task_id :bigint           not null
#

class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :user_id, uniqueness: { scope: :task_id,
                                    message: 'The student is already doing this task' }
end
