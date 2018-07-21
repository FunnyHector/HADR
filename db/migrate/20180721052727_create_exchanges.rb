class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.datetime :happened_at, null: false

      t.timestamps
    end
  end
end
