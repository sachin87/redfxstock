module CategoriesHelper

  def category_list(category)
    if category.present?
      @category_list ||= Category.order(:name).all - [category]
    else
      @category_list ||= Category.order(:name).all
    end
  end

end
