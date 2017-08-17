class AddCommentsToInventories < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :comment, :text
  end
end
