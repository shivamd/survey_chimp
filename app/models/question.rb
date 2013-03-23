class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :choices
  validates :content, :presence => true
end
