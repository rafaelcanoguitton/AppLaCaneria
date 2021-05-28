import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapSample extends StatefulWidget {
  final Function mandar_posi;
  double lat;
  double long;
  MapSample(this.mandar_posi,this.lat,this.long);
  @override
  State<MapSample> createState() => MapSampleState(mandar_posi,lat,long);
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  final Function mandar_pos;
  double lat;
  double long;
  MapSampleState(this.mandar_pos,this.lat,this.long);
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  List<Marker> allMarkers=[];
  @override
  void initState(){
    super.initState();
    allMarkers.add(Marker(markerId: MarkerId('Mimarker'),draggable:false,onTap: (){
      print('YORUSHIIKA');
    },
    position: LatLng(lat,long)));
  }
  _handlepress(LatLng tappedPoint){
    setState(() {
      allMarkers=[];
      allMarkers.add(Marker(markerId: MarkerId('Mimarker'),draggable:false,onTap: (){
      lat=tappedPoint.latitude;
      long=tappedPoint.longitude;
      print("se supone que estos cambian");
      print(lat);
      print(long);
    },
    position: tappedPoint));
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: LatLng(lat,long),zoom: 14.4746),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set.from(allMarkers),
        onLongPress: _handlepress,
        
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          mandar_pos(allMarkers[0].position.latitude,allMarkers[0].position.longitude);
          print("ESTA ES LA POS QUE SE MANDA");
          print(allMarkers[0].position.latitude);
          print(allMarkers[0].position.longitude);
          Navigator.of(context).pop();
        },
        label: Text('Seleccionar esta ubicación'),
        icon: Icon(Icons.place),
      ),
    );
  }

}