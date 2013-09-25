module CategoriesHelper

  def category_list(category)
    Category.order(:name).all - [category]
  end

end
