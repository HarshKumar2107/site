class User < ApplicationRecord
  has_one_attached :profile
	has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :f_name, :username, presence: true
  validates :username, uniqueness: true
end
