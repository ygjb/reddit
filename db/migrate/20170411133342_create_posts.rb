class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.string :post_type
      t.string :link_url
      t.text :body_text
      t.string :img_url

      t.timestamps
    end
  end
end