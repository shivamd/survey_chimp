class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  has_many :users, :through => :answers
  validates :content, :presence => true
end
