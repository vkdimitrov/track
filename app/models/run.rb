class Run < ActiveRecord::Base
  has_attached_file :gpx
  validates_attachment_content_type :gpx, content_type: ['application/xml']
  validates :gpx, attachment_presence: true

end
