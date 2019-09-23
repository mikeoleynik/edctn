# frozen_string_literal: true

# == Schema Information
#
# Table name: pictures
#
#  id      :bigint           not null, primary key
#  image   :string           not null
#  task_id :integer
#

class Picture < ApplicationRecord
  belongs_to :task

  mount_uploader :image, PictureUploader
end
