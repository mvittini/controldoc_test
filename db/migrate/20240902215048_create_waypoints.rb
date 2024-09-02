class CreateWaypoints < ActiveRecord::Migration[7.2]
  def change
    create_table :waypoints do |t|
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.datetime :sent_at, null: false
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
