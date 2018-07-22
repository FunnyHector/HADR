class CreateOfferItems < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_items do |t|
      t.text :offer_type, null: false
      t.text :description
      t.text :photo_link
      t.references :offer, index: true, null: false
      t.references :exchange, index: true


      t.timestamps

      t.index :offer_type
    end
  end
end
