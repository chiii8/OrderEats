class Favorite < ApplicationRecord
  
  belongs_to :customer
  belongs_to :item
  belongs_to :store
  
  validates :customer_id, uniqueness: {scope: :item_id}
  validates :customer_id, uniqueness: {scope: :store_id}
end
