class RemoveFieldsFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :name, :string
    remove_column :players, :email, :string
    remove_column :players, :is_host, :boolean
  end
end
