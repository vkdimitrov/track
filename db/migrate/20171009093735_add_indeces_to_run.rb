class AddIndecesToRun < ActiveRecord::Migration
  def change
    add_index :runs, :gpx_file_name
  end
end
