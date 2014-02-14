class Expertise < ActiveRecord::Base
  attr_accessible :name

  has_many :user_expertises, class_name: 'UserExpertise'
  has_many :users, through: :user_expertises

end
