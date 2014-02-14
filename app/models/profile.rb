class Profile < ActiveRecord::Base

  attr_accessible :dob, :gender, :location, :name, :username,
                  :public_profile, :bio

  belongs_to :user

  mount_uploader :avatar, AvatarUploader

end
