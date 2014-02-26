class InviteOwner < ActiveRecord::Base
  belongs_to :user
  belongs_to :invite
end
