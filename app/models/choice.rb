class Choice < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  validates :content, :presence => true
end
