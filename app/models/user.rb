class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :validatable
  scope :all_except, ->(user) { where.not(id: user) }
  has_many :messages
  has_many :participants
  has_many :rooms, through: :participants
end
