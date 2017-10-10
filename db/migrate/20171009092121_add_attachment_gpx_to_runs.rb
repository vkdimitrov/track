class AddAttachmentGpxToRuns < ActiveRecord::Migration
  def self.up
    change_table :runs do |t|
      t.attachment :gpx
    end
  end

  def self.down
    remove_attachment :runs, :gpx
  end
end
