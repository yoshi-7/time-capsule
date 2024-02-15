class Message < ApplicationRecord
  belongs_to :capsule

  validates :user, :title, :content, presence: true
end
