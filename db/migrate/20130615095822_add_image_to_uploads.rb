class AddImageToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :image, :string
  end
end
