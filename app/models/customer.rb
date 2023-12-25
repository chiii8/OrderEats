class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :favorite, dependent: :destroy
  
  enum gender: { male: 0, female: 1, no_answer: 2}
  
  def active_for_authentication?
    super && (is_active == true ) # 有効でないとログインできない
  end
end
