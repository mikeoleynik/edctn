# frozen_string_literal: true

class Picture < ApplicationRecord
  belongs_to :task

  mount_uploader :image, PictureUploader
end
