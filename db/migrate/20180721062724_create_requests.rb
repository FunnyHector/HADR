class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.text :location, null: false
      t.text :preferred_delivery_option, null: false
      t.datetime :published_at, null: false
      t.references :user, index: true, null: false

      t.timestamps

      t.index :location
      t.index :published_at
      t.index :preferred_delivery_option
    end
  end
end
