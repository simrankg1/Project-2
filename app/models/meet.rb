class Meet < ActiveRecord::Base
  has_many :meet_owners
  has_many :users, through: :meet_owners
end
