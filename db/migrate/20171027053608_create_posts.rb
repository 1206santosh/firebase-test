class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :creator
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
