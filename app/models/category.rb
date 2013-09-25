class Category < ActiveRecord::Base

  attr_accessible :name, :parent_id

  has_ancestry

  def parent_name
    parent.try(:name)
  end

end
