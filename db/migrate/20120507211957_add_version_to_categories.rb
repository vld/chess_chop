class AddVersionToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :version_id, :integer
    add_index  :categories, :version_id
  end
end
