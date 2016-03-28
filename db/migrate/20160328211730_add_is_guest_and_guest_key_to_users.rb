class AddIsGuestAndGuestKeyToUsers < ActiveRecord::Migration
  def up
    add_column :users, :is_guest, :boolean
    add_column :users, :guest_key, :string
  end

  def down
    remove_column :users, :is_guest, :boolean
    remove_column :users, :guest_key, :string
  end
end
