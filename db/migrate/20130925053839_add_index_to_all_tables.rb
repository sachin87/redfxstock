class AddIndexToAllTables < ActiveRecord::Migration
  def change
    add_index :users, :username, unique: true
    add_index :user_roles, :role_id
    add_index :user_roles, :user_id
    add_index :user_roles, [:user_id, :role_id]
    add_index :uploads, :gallery_id
    add_index :uploads, :name
    add_index :tags, :name, unique: true
    add_index :roles, :name, unique: true
    add_index :profiles, :name
    add_index :profiles, :location
    add_index :profiles, :username
    add_index :profiles, :dob
    add_index :profiles, :gender
    add_index :galleries, :name
    add_index :expertises, :name
    add_index :comments, :title
    add_index :categories, :name
  end
end
