class IndexAddressesOnUserid < ActiveRecord::Migration
  def up
    add_index :addresses, :user_id
  end

  def down
    remove_index :addresses, :user_id
  end
end
