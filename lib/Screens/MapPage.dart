import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:where_to/src/locations.dart' as locations;
//import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:where_to/Widgets/NavigationMenu.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late Widget add;
  //void _onMapCreated(GoogleMapController controller) {
  //  mapController = controller;
  //}

  //static final CameraPosition _kGooglePlex = CameraPosition(
  //  target: LatLng(6.240862, -75.590475),
  //  zoom: 15,
  //);

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'WhereTo',
            style: TextStyle(color: Colors.orange, fontSize: 33),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.orange,
                size: size.width * 0.10,
              ),
              onPressed: _showAlertDialog,
            ),
            Container(
              width: size.width * 0.05,
            ),
          ],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(6.240862, -75.590475),
            zoom: 15,
          ),
          markers: _markers.values.toSet(),
        ),
        bottomNavigationBar: NavigationMenu());
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.room, color: Colors.orange),
                          Text("Agregar nueva ubicación",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 15))
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: "Nombre lugar",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, 'OK');
                                      showDialog(
                                          context: context,
                                          builder: (buildcontext) {
                                            return AlertDialog(
                                              title: Text(
                                                  "Se a encontrado la ubicación"),
                                              content:
                                                  Text("¿Desea agregarla?"),
                                              actions: [
                                                TextField(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                      hintText: "Actividad",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context, 'Agregar');
                                                      setState(() {
                                                        final marker = Marker(
                                                          markerId: MarkerId(
                                                              "Parque de San Joaquin"),
                                                          position: LatLng(
                                                              6.245692,
                                                              -75.586691),
                                                          infoWindow:
                                                              InfoWindow(
                                                            title:
                                                                "Parque de San Joaquin",
                                                            snippet:
                                                                "Jugar futbol",
                                                          ),
                                                        );
                                                        _markers[
                                                                "Parque de San Joaquin"] =
                                                            marker;
                                                      });
                                                    },
                                                    child: Text("Agregar"))
                                              ],
                                            );
                                          });
                                    },
                                    child: Text("Buscar en Googel Maps")),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("Ingresar dirección"))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              )
            ],
          );
        });
  }
}

//setState(() {
//                  final marker = Marker(
//                    markerId: MarkerId("Parque de San Joaquin"),
//                    position: LatLng(6.245692, -75.586691),
//                    infoWindow: InfoWindow(
//                      title: "Parque de San Joaquin",
//                      snippet: "",
//                    ),
//                  );
//                  _markers["Parque de San Joaquin"] = marker;
//                });