class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :order_detail
end
