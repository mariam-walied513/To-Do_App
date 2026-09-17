import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationMapScreen extends StatefulWidget {
  const CurrentLocationMapScreen({super.key});
  @override
 _CurrentLocationMapScreenState createState() => _CurrentLocationMapScreenState();
}

class _CurrentLocationMapScreenState extends State<CurrentLocationMapScreen> {
  GoogleMapController? _mapController;
  LatLng? _currenposition;
  Marker? _currentLocationMarker;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }
  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
        return;
    }
     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

     setState(() {
       _currenposition = LatLng(position.latitude, position.longitude);
       _currentLocationMarker = Marker(
        markerId: const MarkerId('current-location'),
        position: _currenposition!,
        infoWindow: InfoWindow(
          title: 'Current Location',),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),

        );
       
     });
     if (_mapController != null) {
       _mapController!.animateCamera(CameraUpdate.newLatLng(_currenposition!));
     }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location'),

      ),
      body: 
      // _currencyposition == null
      // ? const Center(child: CircularProgressIndicator())
      //  : 
      GoogleMap(
        initialCameraPosition: CameraPosition(target: _currenposition!, zoom: 15),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (controller) => _mapController = controller,
        markers: _currentLocationMarker != null ? {_currentLocationMarker!} : {},
       )
    );
  }
}