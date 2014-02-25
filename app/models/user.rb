class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :invites
	has_many :meets
	belongs_to :meet
	belongs_to :invite

	has_many(:contacts, :foreign_key => :user_a_id, :dependent => :destroy)
	has_many(:reverse_contacts, :class_name => :Contact, :foreign_key => :user_b_id, :dependent => :destroy)
	has_many :users, through: :contacts, :source => :user_b

  validates :username, :presence => true, :uniqueness => { :message => "Username is already taken." }

end
