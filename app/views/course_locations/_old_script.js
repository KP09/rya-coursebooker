<script>
  $(document).ready(function() {

    function createSidebarLi(json){
      return ("<li><a>" + json.name + "</a></li>");
    };

    function bindLiToMarker($li, marker){
      $li.on('click', function(){
        handler.getMap().setZoom(10);
        marker.setMap(handler.getMap()); //because clusterer removes map property from marker
        marker.panTo();
        google.maps.event.trigger(marker.getServiceObject(), 'click');
      })
    };

    function createSidebar(json_array){
      _.each(json_array, function(json){
        var $li = $( createSidebarLi(json) );
        $li.appendTo('#sidebar_container');
        bindLiToMarker($li, json.marker);
      });
    };

    function addListenersToMarkers(json_array){
      _.each(json_array, function(json){
        const marker = json.marker
      });
    };

    handler = Gmaps.build('Google');
    handler.buildMap({ internal: {id: 'map'}}, function(){
      var json_array = <%= raw @coordinates_hash.to_json %>;

      var markers = handler.addMarkers(json_array);

      _.each(json_array, function(json, index){
        json.marker = markers[index];
      });
      createSidebar(json_array);
      addListenersToMarkers(json_array);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      });
    });

</script>
