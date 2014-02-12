class Profile < ActiveRecord::Base
  attr_accessible :dob, :gender, :location, :name, :username

  belongs_to :user
end
