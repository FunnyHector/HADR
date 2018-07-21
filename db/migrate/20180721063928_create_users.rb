class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email_address, null: false
      t.text :password, null: false
      t.text :name
      t.text :contact_number
      t.text :profile_picture

      t.timestamps

      t.index :email_address, unique: true
    end
  end
end
