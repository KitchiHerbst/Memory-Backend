class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :timeline_id
      t.integer :user_id
      t.string :picture
      t.text :text
      t.string :date
      t.string :location
      t.timestamps
    end
  end
end
