class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.string :username
      t.string :gender
      t.date :dob

      t.timestamps
    end
  end
end
