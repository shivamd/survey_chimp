class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  validates :content, :presence => true
end
