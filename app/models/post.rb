class Post < ApplicationRecord
  has_one_attached :cover
  has_many :comments, dependent: :destroy
	belongs_to :user
end
