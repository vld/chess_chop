class AddVersionToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :version_id, :integer
  end
end
