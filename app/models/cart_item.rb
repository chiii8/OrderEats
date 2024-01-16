class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :customer
    
    def subtotal
      item.with_tax_price * quantity
    end
    
    validates :quantity, presence: true #空でないこと
end
