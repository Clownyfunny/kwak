class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.float :rating
      t.string :author
      t.integer :id_category
      t.datetime :created_at

      t.timestamps
    end
  end
end
