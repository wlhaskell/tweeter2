class RemovePicFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :pic, :string
  end
end
