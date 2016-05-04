class CreateGuestsTable < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.string :guest_key
      t.timestamps
    end
  end
end
