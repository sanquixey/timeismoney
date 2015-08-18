class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :braintree_id
      t.integer :cents

      t.timestamps null: false
    end
  end
end
