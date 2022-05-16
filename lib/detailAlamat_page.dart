import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class detailAlamatPage extends StatefulWidget {
  @override
  _detailAlamatPageState createState() => _detailAlamatPageState();
}

class _detailAlamatPageState extends State<detailAlamatPage> {

  final Set<Marker> _markers = {};
  final LatLng _currentPosition = LatLng(-7.8032076, 110.3573354);

  @override
  void initState() {
    _markers.add(Marker(
        markerId: MarkerId('-7.8032076, 110.3573354'),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return new Scaffold(
        appBar: AppBar(
          title: Text("Detail Alamat",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff00B3D8)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        // body: Column(children: [Text(latitudeData), Text(longitudeData)]),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: _currentPosition, zoom: 14),
          markers: _markers,
        ));
  }
}