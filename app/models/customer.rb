class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :profile_image
  
  enum gender: { male: 0, female: 1, no_answer: 2 }
  
  def active_for_authentication?
    super && (is_active == true ) # 有効でないとログインできない
  end
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/logo.PNG')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def full_name
    last_name + first_name
  end
  
  def full_name_kana
    last_name_kana + first_name_kana
  end
  
  def self.guest
    find_or_create_by!(email: 'guest@email.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "ゲスト"
      customer.first_name = "太郎"
      customer.last_name_kana = "ゲスト"
      customer.first_name_kana = "タロウ"
      customer.telephone_number = "00000000000"
      customer.gender = "no_answer"
      customer.is_active = true
    end
  end
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :telephone_number, presence: true
  validates :gender, presence: true
end
