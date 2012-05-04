class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :main_image, :default => 0
      t.references :category
      t.float :price

      t.timestamps
    end
    add_index :items, :category_id
  end
end
