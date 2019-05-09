class Place < ApplicationRecord
	belongs_to :post, inverse_of: :places
end
