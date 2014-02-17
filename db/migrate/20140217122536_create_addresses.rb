class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.integer :state_id
      t.string :zip_code
      t.integer :country_id
      t.integer :user_id

      t.timestamps
    end
  end
end
