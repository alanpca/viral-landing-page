class Invite < ActiveRecord::Base
  validates_format_of :email, :with => RFC822::EMAIL
end
