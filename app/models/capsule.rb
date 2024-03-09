class Capsule < ApplicationRecord
  belongs_to :user
  has_many :user_capsules, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many_attached :photos
  has_many_attached :videos
  has_many :videos_file_attachment, dependent: :destroy
  has_many :videos_file_blob, through: :videos_files_attachment
  has_many_attached :audios

  validates :user, presence: true
  validates :photos, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif', 'heic']
  validates :videos, content_type: 'video/*'
  validates :audios, content_type: ['audio/mpeg', 'audio/wav', 'audio/ogg', 'audio/flac', 'audio/aac', 'audio/mp3']

  attr_reader :progression

  def progression
    remaining_days = (unlock_date - Time.now.to_date).to_i
    encapsulation_days = (unlock_date - encapsulation_date).to_i
    percentage = (remaining_days * 100) / encapsulation_days
    100 - percentage
  end
end
