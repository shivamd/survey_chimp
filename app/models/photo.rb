class Photo < ActiveRecord::Base
  mount_uploader :name, PhotoUploader
  belongs_to :user
  belongs_to :survey


end
