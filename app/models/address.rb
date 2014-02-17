class Address < ActiveRecord::Base
  attr_accessible :address_line_one, :address_line_two, :city, :country_id, :state, :user_id, :zip_code
end
