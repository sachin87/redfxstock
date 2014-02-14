class UserExpertise < ActiveRecord::Base
  attr_accessible :expertise_id, :user_id

  belongs_to :expertise
  belongs_to :user

end
