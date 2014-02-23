class Invite < ActiveRecord::Base
  has_many :users
  belongs_to :user
end
