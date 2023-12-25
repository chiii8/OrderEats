class Favorite < ApplicationRecord
  
  belongs_to :customer
  belongs_to :item
  belongs_to :store
  
  validates :custoemr_id, uniqueness: {scope: :item_id}
  validates :custoemr_id, uniqueness: {scope: :stoemr_id}
end
