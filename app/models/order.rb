class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  has_many :reviews, dependent: :destroy
  
  enum payment_method: { credit_card: 0, cash: 1}
end
