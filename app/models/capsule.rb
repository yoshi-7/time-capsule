class Capsule < ApplicationRecord
  belongs_to :user
  has_many :user_capsules
  has_many :messages

  validates :user, :encapsulation_date, presence: true
end
