namespace :run do
  desc 'import runs from gpx files'
  task import: :environment do
    files = Dir[Rails.application.config.gpx_folder]#.sort_by { |f| File.mtime(f) }

    files.each do |file|
      file_name = File.basename(file)
      next if Run.find_by_gpx_file_name(file_name)
      run = Run.new(gpx: open(file))
      if run.save!
        gpx = GPX::GPXFile.new(gpx_file: run.gpx.path)
        run.duration = gpx.duration
        run.lowest = gpx.lowest_point.elevation
        run.highest = gpx.highest_point.elevation
        run.average_speed = gpx.average_speed
        run.distance = gpx.distance
        run.start_at = gpx.tracks.first.segments.first.points.first.time
        run.lat = gpx.tracks.first.segments.first.points.first.lat
        run.lon = gpx.tracks.first.segments.first.points.first.lon
        run.save!
      end
    end
  end
end
