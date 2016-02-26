class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_type
      t.string :title
      t.string :description
      t.text :context
      t.string :photo_url
      t.references :trip

      t.timestamps null: false
    end
  end
end
