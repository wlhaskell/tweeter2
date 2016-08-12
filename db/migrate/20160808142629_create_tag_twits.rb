class CreateTagTwits < ActiveRecord::Migration
  def change
    create_table :tag_twits do |t|
      t.integer :tag_id
      t.integer :twit_id

      t.timestamps null: false
    end
  end
end
