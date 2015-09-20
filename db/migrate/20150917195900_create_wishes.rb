class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.text :notes
      t.integer :user_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
