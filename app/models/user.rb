class User < ApplicationRecord
  has_many :capsules
  has_many :user_capsules
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
