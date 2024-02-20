class Message < ApplicationRecord
  belongs_to :capsule

  validates :title, :content, presence: true
end
