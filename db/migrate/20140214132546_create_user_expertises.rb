class CreateUserExpertises < ActiveRecord::Migration
  def change
    create_table :user_expertises do |t|
      t.integer :user_id
      t.integer :expertise_id

      t.timestamps
    end
  end
end
20140214123346