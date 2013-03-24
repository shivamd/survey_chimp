class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  version :gallery do 
    process resize_to_fill: [450, 350]
  end

  version :profile do 
    process resize_to_fill: [250, 250]
  end

  version :avatar do 
    process resize_to_fill: [50, 50]
  end
end
