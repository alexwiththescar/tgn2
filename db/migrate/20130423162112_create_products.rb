class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.decimal :ammount
      t.decimal :price
      t.string :category
      t.string :pic_file_name
      t.string :pic_content_type
      t.float :pic_file_size
      t.datetime :pic_updated_at
      t.boolean :delta, :default => true, :null => false

      t.timestamps
    end
    add_index :products, [:user_id, :created_at]
  end
end
