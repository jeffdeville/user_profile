class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user

      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
