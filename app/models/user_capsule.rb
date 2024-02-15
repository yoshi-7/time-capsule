class UserCapsule < ApplicationRecord
  belongs_to :user
  belongs_to :capsule

  validates :user, :capsule, presence: true
end
