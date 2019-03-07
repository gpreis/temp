class CreateCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :phone, null: false, index: true
      t.string :name,  null: false
      t.text   :notes

      t.timestamps
    end
  end
end
