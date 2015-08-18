class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :braintree_id

      t.timestamps null: false
    end
  end
end
