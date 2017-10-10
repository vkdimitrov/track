class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :duration, default: 0
      t.integer :lowest
      t.integer :highest
      t.float :average_speed
      t.integer :distance
      t.timestamp :start_at
      t.string :lat, limit: 10
      t.string :lon, limit: 10
      t.timestamps null: false
    end
  end
end
