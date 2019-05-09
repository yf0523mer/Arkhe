class Image < ApplicationRecord
	attachment :image
	belongs_to :post, inverse_of: :images
end
