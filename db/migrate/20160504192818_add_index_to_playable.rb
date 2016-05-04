class AddIndexToPlayable < ActiveRecord::Migration
  def change
    add_index :players, [:playable_type, :playable_id]
  end
end
