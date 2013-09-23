class Category < ActiveRecord::Base

   attr_accessible :name, :parent_id

  def parent_name
    if parent_id
      Category.find(parent_id).name
    end
  end

end
