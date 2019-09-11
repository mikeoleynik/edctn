class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # process scale: [200, 300]

  # def scale(width, height)
  #   # do something
  # end

  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
