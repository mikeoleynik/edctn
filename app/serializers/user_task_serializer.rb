# frozen_string_literal: true

# == Schema Information
#
# Table name: user_tasks
#
#  id      :bigint           not null, primary key
#  user_id :bigint           not null
#  task_id :bigint           not null
#

class UserTaskSerializer < BaseSerializer
  attributes :user_id, :task_id
end
