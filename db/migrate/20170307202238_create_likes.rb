class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :bote
      t.references :likeable, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
