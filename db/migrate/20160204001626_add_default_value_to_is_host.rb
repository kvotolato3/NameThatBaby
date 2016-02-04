class AddDefaultValueToIsHost < ActiveRecord::Migration
  def up
    change_column :players, :is_host, :boolean, :default => false
  end

  def down
    change_column :players, :is_host, :boolean, :default => nil
  end
end
