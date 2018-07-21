class CreateCommunityHubs < ActiveRecord::Migration[5.2]
  def change
    create_table :community_hubs do |t|
      t.text :name, null: false
      t.text :location, null: false
      t.text :address, null: false
      t.text :guide_link

      t.timestamps

      t.index :name
      t.index :location
      t.index :address
    end
  end
end
