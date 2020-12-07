class ImageUploader < CarrierWave::Uploader::Base
  
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "default.jpg"
  end

  def extension_whitelist
    %w(png jpg)
  end

  def filename
    original_filename if original_filename
  end
end
