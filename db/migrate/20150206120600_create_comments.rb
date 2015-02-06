class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end