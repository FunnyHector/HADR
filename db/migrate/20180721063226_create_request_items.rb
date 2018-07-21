class CreateRequestItems < ActiveRecord::Migration[5.2]
  def change
    create_table :request_items do |t|
      t.text :type, null: false
      t.text :description, null: false
      t.references :request, index: true, null: false
      t.references :exchange, index: true, null: false

      t.timestamps

      t.index :type
    end
  end
end
