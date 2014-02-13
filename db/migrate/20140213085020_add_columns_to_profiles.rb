class AddColumnsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :bio, :text
    add_column :profiles, :public_profile, :boolean
  end
end
