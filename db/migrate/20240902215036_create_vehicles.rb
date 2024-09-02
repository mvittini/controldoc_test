class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.string :identifier, null: false

      t.timestamps
    end
    add_index :vehicles, :identifier, unique: true
  end
end
