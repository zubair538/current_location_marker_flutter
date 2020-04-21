
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: Locations(context));
  }

  Widget Locations(context) {
    ///marker list
    final Map<String, Marker> _markers = {};

    final LatLng _center = const LatLng(31.465852, 74.255568);
    final marker = new Marker(
      markerId: MarkerId('1'),
      position: LatLng(31.465321, 74.254249),
      infoWindow: InfoWindow(
        title: 'Burger kings',
        snippet: 'johar town',
      ),
    );

    final Marker msk = new Marker(
        markerId: MarkerId('2'),
        position: LatLng(31.464955, 74.255622),
        infoWindow: InfoWindow(
          title: 'IOI Technology Private Limited',
          snippet: 'johar town',
        ));
    _markers['1'] = marker;
    _markers['2'] = msk;

    void _onMapCreated(GoogleMapController controller) {}
    return Stack(
      children: <Widget>[
        Container(
            child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 12,
          ),
          markers: _markers.values.toSet(),
        )),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: 550,left: 40),
              child: RaisedButton(child: Text("click"),color: Colors.blue,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              )
          ),
        ),
      ],
    );
  }
}
