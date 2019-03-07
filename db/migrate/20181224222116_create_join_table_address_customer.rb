class CreateJoinTableAddressCustomer < ActiveRecord::Migration[5.2]
  def change
    create_join_table :addresses, :customers do |t|
      t.index [:address_id, :customer_id]
      t.index [:customer_id, :address_id]
    end

    add_foreign_key :addresses_customers, :addresses
    add_foreign_key :addresses_customers, :customers
  end
end
