class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name
      t.integer :gallery_id

      t.timestamps
    end
  end
end
