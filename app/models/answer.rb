class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :user
  # Remember to create a migration!
end
