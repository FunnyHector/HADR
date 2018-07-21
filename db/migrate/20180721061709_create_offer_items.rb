class CreateOfferItems < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_items do |t|
      t.text :type, null: false
      t.text :description, null: false
      t.text :photo_link
      t.references :offer, index: true, null: false
      t.references :exchange, index: true, null: false


      t.timestamps

      t.index :type
    end
  end
end
