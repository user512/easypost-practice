class CreatePackages < ActiveRecord::Migration

  def change
    create_table :packages do |t|
      t.string :postage_label
      t.string :tracking_number


      t.timestamps null: false
    end
  end
end
