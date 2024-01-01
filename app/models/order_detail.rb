class OrderDetail < ApplicationRecord
    belongs_to :item
    belongs_to :order
    has_many :reviews, dependent: :destroy
end
