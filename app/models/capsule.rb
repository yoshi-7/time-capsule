class Capsule < ApplicationRecord
  belongs_to :user
  has_many :user_capsules, dependent: destroy_all
  has_many :messages, dependent: destroy_all

  has_many_attached :photos
  has_many_attached :videos
  has_many_attached :audios

  validates :user, presence: true
end
