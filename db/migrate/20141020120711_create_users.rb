class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :photo_url
      t.string :password_digest

      t.timestamps
    end
  end
end
