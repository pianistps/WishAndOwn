class CreateWishlistItems < ActiveRecord::Migration[5.0]
  def change
    create_table :wishlist_items do |t|
      t.integer :item_id
      t.integer :wishlist_id

      t.timestamps
    end
  end
end
