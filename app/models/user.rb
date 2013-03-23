class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys
  has_many :answers
  has_many :choices, :through => :answers

  VALID_EMAIL_REGEX = /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/

  validates :email, :uniqueness => true, :presence => true, format: { :with => VALID_EMAIL_REGEX } 
  validates :username, :uniqueness => true, :presence => true
  # validates :password, :presence => true,

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
