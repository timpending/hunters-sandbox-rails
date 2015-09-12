class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :started_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
