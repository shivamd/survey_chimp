class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file


    version :thumb do 
    process resize_to_fill: [200, 200]
  end

  version :thumb do 
    process resize_to_fill: [400, 400]
  end
end
