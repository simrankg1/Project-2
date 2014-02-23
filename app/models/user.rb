class User < ActiveRecord::Base

has_many :invites
has_many :meets

has_many :contacts
has_many :users, through: :contacts

end
