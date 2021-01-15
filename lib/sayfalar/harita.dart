import 'package:BursayiKesfet/bloc/harita_bloc.dart';
import 'package:BursayiKesfet/static/replacer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;

class Harita extends StatefulWidget {
  @override
  _HaritaState createState() => _HaritaState();
}

class _HaritaState extends State<Harita> with AutomaticKeepAliveClientMixin {
  double baslaLat, baslaLong;
  HaritaBloc _haritaBloc;
  List<Marker> markerlar = [];

  var _mySelection;

  @override
  initState() {
    super.initState();
    _haritaBloc = HaritaBloc();
  }

  @override
  dispose() {
    _haritaBloc.dispose();
    super.dispose();
  }

  konumBul() async {
    await geo.Geolocator.getCurrentPosition(
            desiredAccuracy: geo.LocationAccuracy.high)
        .then((value) {
      baslaLat = value.latitude;
      baslaLong = value.longitude;
    });
    return true;
  }

  List<Polyline> polylines = [];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        FutureBuilder(
            future: konumBul(),
            builder: (BuildContext contex, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return StreamBuilder(
                  stream: _haritaBloc.rotalarStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      polylines.add(Polyline(
                          polylineId: PolylineId("poly"),
                          width: 6,
                          color: Colors.blue.shade700,
                          geodesic: true,
                          points: snapshot.data));
                      markerlar = List.generate(
                        _haritaBloc.mekanListesi.length,
                        (index) => Marker(
                            markerId: MarkerId(index.toString()),
                            infoWindow: InfoWindow(
                              title: index.toString(),
                              snippet: _haritaBloc.mekanListesi[index].title,
                            ),
                            position: LatLng(
                              double.parse(_haritaBloc.mekanListesi[index].lat),
                              double.parse(
                                  _haritaBloc.mekanListesi[index].long),
                            ),
                            onTap: () {
                              _haritaBloc.anasayfaCardSink
                                  .add(_haritaBloc.mekanListesi[index]);
                            }),
                      );

                      return GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(baslaLat, baslaLong), zoom: 16),
                        polylines: Set<Polyline>.of(polylines),
                        onMapCreated: (controller) {},
                        markers: Set<Marker>.of(markerlar),
                        myLocationEnabled: true,
                        onTap: (argument) {
                          _haritaBloc.anasayfaCardSink.add(null);
                        },
                        gestureRecognizers:
                            <Factory<OneSequenceGestureRecognizer>>[
                          new Factory<OneSequenceGestureRecognizer>(
                            () => new EagerGestureRecognizer(),
                          ),
                        ].toSet(),
                      );
                    } else {
                      return GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(baslaLat, baslaLong), zoom: 16),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        gestureRecognizers:
                            <Factory<OneSequenceGestureRecognizer>>[
                          new Factory<OneSequenceGestureRecognizer>(
                            () => new EagerGestureRecognizer(),
                          ),
                        ].toSet(),
                      );
                    }
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        StreamBuilder(
            stream: _haritaBloc.kategorilerStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Positioned(
                  bottom: 100,
                  child: DropdownButton(
                    items: List.generate(
                      snapshot.data.length,
                      (index) => DropdownMenuItem(
                        child: Text(snapshot.data[index].title),
                        value: snapshot.data[index].id,
                      ),
                    ),
                    onChanged: (newVal) {
                      setState(() {
                        _mySelection = newVal;
                        _haritaBloc.kategorilereGoreMekan(newVal);
                        _haritaBloc.anasayfaCardSink.add(null);
                      });
                    },
                    value: _mySelection,
                  ),
                );
              } else {
                return Container();
              }
            }),
        StreamBuilder(
            stream: _haritaBloc.anasayfaCardStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Positioned(
                  height: MediaQuery.of(context).size.height * 0.25,
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                      child: Stack(
                    children: [
                      Positioned(
                          bottom: 0,
                          top: 0,
                          left: 5,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                              snapshot.data.thumb,
                              fit: BoxFit.fill,
                            ),
                          )),
                      Positioned(
                        right: 0,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data.title,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(Replacer.replace(snapshot.data.content))
                          ],
                        ),
                      ),
                    ],
                  )),
                );
              } else {
                return Container();
              }
            }),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
