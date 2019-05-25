class Post < ApplicationRecord
	belongs_to :user
	has_many :images, dependent: :destroy
	has_many :images, inverse_of: :post
  	accepts_attachments_for :images, attachment: :image
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :places
	accepts_nested_attributes_for :places, allow_destroy: true

	validates :title, presence: true
	validates :text, presence: true
	has_many  :favorite_posts, through: :favorites, source: :user

	def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
    end
end
