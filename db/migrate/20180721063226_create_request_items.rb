class CreateRequestItems < ActiveRecord::Migration[5.2]
  def change
    create_table :request_items do |t|
      t.text :request_type, null: false
      t.text :description
      t.references :request, index: true, null: false
      t.references :exchange, index: true

      t.timestamps

      t.index :request_type
    end
  end
end
