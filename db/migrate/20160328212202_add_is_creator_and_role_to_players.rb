class AddIsCreatorAndRoleToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :is_creator, :boolean
    add_column :players, :role, :string
  end

  def down
    remove_column :players, :is_creator, :boolean
    remove_column :players, :role, :string
  end
end
