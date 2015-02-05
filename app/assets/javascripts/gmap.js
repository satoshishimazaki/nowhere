// window.onload =function() {
//     if (navigator.geolocation) {
//         navigator.geolocation.getCurrentPosition(function(position) {
//             var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
//             var options = {
//                 zoom: 15,
//                 center: latlng,
//                 mapTypeId: google.maps.MapTypeId.ROADMAP
//             };
//             var map = new google.maps.Map(document.getElementById('map'), options);
//             var marker = new google.maps.Marker({
//                 position: latlng,
//                 map: map,
//                 title: '現在地'
//             });
//         }, function(e) {
//             document.getElementById('message').innerHTML = typeof e == 'string' ? e : e.message;
//         });
//     } else {
//         document.getElementById('message').innerHTML = 'Location APIがサポートされていません。';
//     }
// };