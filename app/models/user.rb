class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, uniqueness: true
  
  has_many :items
  has_one :address
  has_many :buys

  validates :email, presence: true, uniqueness: true
  has_one :profile
  accepts_nested_attributes_for :profile
  has_one :credit
  validates :password, length: { minimum: 7 }
end
