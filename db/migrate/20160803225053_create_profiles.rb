class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :age
      t.date :birthday
      t.text :bio
      t.string :pic
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
