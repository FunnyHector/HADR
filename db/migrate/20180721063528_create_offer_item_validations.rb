class CreateOfferItemValidations < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_item_validations do |t|
      t.datetime :validated_at, null: false
      t.datetime :validation_note
      t.datetime :invalidated_at, null: false
      t.datetime :invalidation_reason, null: false
      t.references :user, index: true, null: false
      t.references :offer, index: true, null: false

      t.timestamps

      t.index :validated_at
      t.index :invalidated_at
    end
  end
end
