class UserRole < ActiveRecord::Base
  attr_accessible :role_id, :user_id

  validates :role_id, :user_id, presence: true

  belongs_to :user
  belongs_to :role
end
