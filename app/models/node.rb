# frozen_string_literal: true

# Join table for Theme and Task

# == Schema Information
#
# Table name: nodes
#
#  id       :bigint           not null, primary key
#  theme_id :bigint           not null
#  task_id  :bigint           not null
#  access   :boolean          default(FALSE)
#

class Node < ApplicationRecord
  belongs_to :theme
  belongs_to :task
end
