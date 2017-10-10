//= require openlayers.js

function init(){
  var map_holder = document.getElementById('map')
  var lon = map_holder.dataset.lon
  var lat = map_holder.dataset.lat
  var gpx = map_holder.dataset.gpx

  var map = new OpenLayers.Map( 'map', {
    numZoomLevels: 19,
    units: 'm',
  });

  var layer = new OpenLayers.Layer.OSM( "Simple OSM Map");
  map.addLayer(layer);

  // Add the Layer with the GPX Track
  var lgpx = new OpenLayers.Layer.Vector("Lakeside cycle ride", {
    strategies: [new OpenLayers.Strategy.Fixed()],
    protocol: new OpenLayers.Protocol.HTTP({
        url: gpx,
        format: new OpenLayers.Format.GPX()
    }),
    style: {strokeColor: "green", strokeWidth: 5, strokeOpacity: 0.5},
    projection: new OpenLayers.Projection("EPSG:4326")
  });
  map.addLayer(lgpx);

  map.setCenter(
    new OpenLayers.LonLat(lon, lat).transform(
      new OpenLayers.Projection("EPSG:4326"),
      map.getProjectionObject()
    ), 14
  );
}

$(document).on('turbolinks:load', function() {
  init();
});