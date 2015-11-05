class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :company
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone
      t.references :package

      t.timestamps null: false
    end
  end
end
