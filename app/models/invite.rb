class Invite < ActiveRecord::Base
  attr_accessible :email
  validates_format_of :email, :with => RFC822::EMAIL
end
