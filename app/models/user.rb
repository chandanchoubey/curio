class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope:order_by_first_name, -> { order('LOWER(first_name)') }
  validates :first_name, presence: true
  after_commit :add_default_avatar, on: %i[create update]
  has_many :products
  has_one_attached :avatar
  has_many :orders

  def avatar_thumbnail
   # if avatar.attached? 
      avatar.variant(resize: "150x150!").processed
    # else
    #   "default.jpg"
    #end
  end

  private 
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            "app", "assets", "images", "default.jpg"
          )
        ), 
        filename: "default.jpg",
        content_type: 'image/jpg'
      )
    end
  end
end
