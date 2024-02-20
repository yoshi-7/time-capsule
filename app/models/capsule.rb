class Capsule < ApplicationRecord
  belongs_to :user
  has_many :user_capsules, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many_attached :photos
  has_many_attached :videos
  has_many_attached :audios

  validates :user, presence: true
  validates :photos, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif', 'heic']
  validates :videos, content_type: ['video/mp4', 'video/mov', 'video/avi']
  validates :audios, content_type: ['audio/mpeg', 'audio/wav', 'audio/ogg', 'audio/flac', 'audio/aac']

end
