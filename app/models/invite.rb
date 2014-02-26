class Invite < ActiveRecord::Base
  has_many :invite_owners
  has_many :users, through: :invite_owners
end
