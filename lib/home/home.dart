//import '../pointsLocation/firstp';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../drawer/drawer.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:http/http.dart' as http;

bool stationreservedetails = false;
bool itisreserved = false;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool nerbies = false;
  bool qrcode = false;
  int index = 0;
  MapController _mapController = MapController();
  final PopupController _popupLayerController = PopupController();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void gotoswapping() {
    setState(() {
      stationreservedetails = false;
      itisreserved = true;
    });
  }

  void goToMyLocation() {
    setState(() {
      _mapController.move(LatLng(30.06182100024835, 31.3495103871507), 13.1);
    });
  }

  List<Map<String, double>> points = [
    {
      // el7ay eltamin ta7t
      'lat': 30.056144119841832,
      'lon': 31.346521405013654,
    },
    {
      // el 4ahied a7mad mostafa ( emen 5als)
      'lat': 30.06871991369923,
      'lon': 31.36254960526736,
    },
    {
      // msakin mohandsen fo2
      'lat': 30.07779170687538,
      'lon': 31.346853037338626,
    },
    {
      // el7adika eldawlia t7t 4mal
      'lat': 30.054703736407014,
      'lon': 31.32933888666969,
    },
    {
      // stad elkahira fo2 4mal
      'lat': 30.073807654195623,
      'lon': 31.322241637283838,
    },
    
  ];

  List<Map<String, String>> allstations = [
    {
      "place": "el7ay eltamin",
      "distance": "2.4",
      "time": (270 / 60).toStringAsFixed(1),
    },
    {
      "place": "4ahied a mostafa",
      "distance": "2.91",
      "time": (290 / 60).toStringAsFixed(1),
    },
    {
      "place": "msakin  mohandsen",
      "distance": "3.2",
      "time": (360 / 60).toStringAsFixed(1),
    },
    {
      "place": "el7adika eldawlia",
      "distance": "3.34",
      "time": "6.1",
    },
    {
      "place": "elkahira stadium ",
      "distance": "3.58",
      "time": (384 / 60).toStringAsFixed(1),
    },
  ];

  List<LatLng> _steps = [];

// Fetch content from the json file
  Future<void> readJson(int i) async {
    _steps = [];
    final response = await http.get(Uri.parse(
        'http://206.81.23.75:6020/route/v1/driving/31.3495103871507,30.06182100024835;${points[i]['lon']},${points[i]['lat']}?geometries=geojson&steps=true'));
    //rootBundle.loadString('assets/point${i}.json');
    final data = await json.decode(response.body);

    for (var pLocation in data["routes"][0]["geometry"]["coordinates"]) {
      _steps.add(LatLng(pLocation[1], pLocation[0]));
    }
  }

  void gotoreservedetails(int i) {
    setState(() {
      index = i;
      stationreservedetails = true;
      _mapController.move(
          LatLng(points[index]['lat']!, points[index]['lon']!), 13.1);
      readJson(i);
    });
  }

  late final List<Marker> _markers = points.map((point) {
    return Marker(
      height: 35,
      width: 35,
      //anchorPos: AnchorPos.align(AnchorAlign.top),
      point: LatLng(point['lat']!, point['lon']!),
      builder: (context) => Image.asset(
        'assets/marker.jpg',
        //height: 80,
        fit: BoxFit.cover,
      ),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: MenuDrawer(),
      //key: _scaffoldKey,
      body: Builder(builder: (context) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  center: LatLng(30.06182100024835, 31.3495103871507),
                  zoom: 13.2,
                  onTap: (_, __) => _popupLayerController.hideAllPopups(),
                ),
                nonRotatedChildren: [
                  AttributionWidget.defaultWidget(
                    source: 'OpenStreetMap contributors',
                    onSourceTapped: null,
                  ),
                ],
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        height: 20,
                        width: 20,
                        point: LatLng(30.06182100024835, 31.3495103871507),
                        builder: (context) => CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/loca.png',
                          ),
                          //radius: 10,
                        ),
                      ),
                      ..._markers,
                    ],
                  ),
                  PopupMarkerLayerWidget(
                    options: PopupMarkerLayerOptions(
                        popupController: _popupLayerController,
                        markers: _markers,
                        markerRotateAlignment:
                            PopupMarkerLayerOptions.rotationAlignmentFor(
                                AnchorAlign.none),
                        popupBuilder: (BuildContext context, Marker marker) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            width: 130,
                            height: 75,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  allstations[_markers.indexOf(marker)]
                                      ["place"]!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    //fontWeight: FontWeight.w700,
                                    fontFamily: 'cairo',
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${allstations[_markers.indexOf(marker)]["distance"]!} km",
                                      style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.w500,
                                        fontFamily: 'mont',
                                      ),
                                    ),
                                    Text(
                                      "(${allstations[_markers.indexOf(marker)]["time"]!})min",
                                      style: TextStyle(
                                        fontSize: 12,
                                        //fontWeight: FontWeight.w500,
                                        fontFamily: 'mont',
                                      ),
                                    ),
                                  ],
                                ),
                                // Icon(
                                //   Icons.battery_0_bar_outlined,
                                //   size: 18,
                                // ),
                                // Text(
                                //   " Full  ",
                                //   style: TextStyle(
                                //     fontSize: 14,
                                //     fontWeight: FontWeight.w700,
                                //     color: Color(0xff3BF266),
                                //     fontFamily: 'cairo',
                                //   ),
                                // ),
                                Text(
                                  "battery available 100 %",
                                  style: TextStyle(
                                    color: Color(0xff3BF266),
                                    fontSize: 12,
                                    //fontWeight: FontWeight.w500,
                                    fontFamily: 'cairo',
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  if (_steps.length > 0)
                    PolylineLayer(
                      //polylineCulling: false,
                      polylines: [
                        Polyline(
                          //isDotted: true,
                          borderStrokeWidth: 1,
                          strokeCap: StrokeCap.round,
                          strokeWidth: 3,
                          points: _steps,

                          color: Color(0xff1851D1),
                        ),
                      ],
                    ),
                ],
              ),
              Positioned(
                top: 40,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              itisreserved
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: qrcode ? 360 : 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                top: 25,
                                bottom: 10,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  LeadingStation(index),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TitleStation(
                                      index,
                                      allstations[index]["place"]!,
                                      allstations[index]["distance"]!,
                                      allstations[index]["time"]!),
                                  Spacer(),
                                  // TrailingStation(
                                  //   stationreservedetails,
                                  // ),
                                  Text(
                                    'Reserved',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff3BF266),
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (qrcode)
                              Text(
                                'Scan QR code',
                                style: TextStyle(
                                  fontFamily: 'cairo',
                                ),
                              ),
                            if (qrcode)
                              SizedBox(
                                height: 5,
                              ),
                            if (qrcode)
                              Expanded(
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    border: Border.all(
                                        color: Colors.black54, width: .5),
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 30,
                              ),
                              child: GestureDetector(
                                onTap: qrcode
                                    ? () {
                                        setState(() {
                                          nerbies = false;
                                          itisreserved = false;
                                          qrcode = false;
                                          index = -1;
                                        });
                                      }
                                    : () {
                                        setState(() {
                                          qrcode = true;
                                        });
                                      },
                                child: Container(
                                  width: double.infinity,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xff3BF266),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    qrcode ? 'Done' : 'Start Swapping',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      // fontWeight: FontWeight.w500,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : stationreservedetails
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _steps = [];
                                        stationreservedetails = false;
                                        nerbies = true;
                                        itisreserved = false;
                                        //index = -1;
                                        goToMyLocation();

                                        // qrcode = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      LeadingStation(index),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      TitleStation(
                                        index,
                                        allstations[index]["place"]!,
                                        allstations[index]["distance"]!,
                                        allstations[index]["time"]!,
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 20,
                                  ),
                                  child: TrailingStation(
                                    stationreservedetails,
                                    gotoswapping,
                                    () => gotoreservedetails(0),
                                    //() => readJson(0)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : nerbies
                          ? Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 400,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Nearby Stations',
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Color(0xff1851D1),
                                                fontFamily: 'cairo',
                                              ),
                                            ),
                                            Spacer(),
                                            IconButton(
                                              onPressed: (() => setState(
                                                    () {
                                                      nerbies = false;
                                                    },
                                                  )),
                                              icon: Icon(
                                                Icons.menu_open_outlined,
                                                color: Color.fromARGB(
                                                    255, 44, 148, 232),
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: points.length,
                                        itemBuilder: (context, i) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              top: 0,
                                            ),
                                            child: ListTile(
                                              onTap: () {
                                                gotoreservedetails(i);
                                                //readJson(i);
                                              },
                                              leading: LeadingStation(i),
                                              title: TitleStation(
                                                  i,
                                                  allstations[i]["place"]!,
                                                  allstations[i]["distance"]!,
                                                  allstations[i]["time"]!),
                                              trailing: TrailingStation(
                                                stationreservedetails,
                                                gotoswapping,
                                                () => gotoreservedetails(i),
                                                //() => readJson(i),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: Offset(
                                          -1, -1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        nerbies = true;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 300,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xff3BF266),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: Text(
                                        'Find Nearby Station',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          // fontWeight: FontWeight.w500,
                                          fontFamily: 'cairo',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
              Positioned(
                top: 40,
                right: 10,
                child: GestureDetector(
                  onTap: () => goToMyLocation(),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Icon(
                      Icons.my_location_outlined,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class TrailingStation extends StatefulWidget {
  bool stationreservedetails;
  final VoidCallback gotoswapping;
  final VoidCallback gotoreservedetails;
  //final VoidCallback readjson;

  TrailingStation(
    this.stationreservedetails,
    this.gotoswapping,
    this.gotoreservedetails,
  );

  @override
  State<TrailingStation> createState() => _TrailingStationState();
}

class _TrailingStationState extends State<TrailingStation> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: stationreservedetails
          ? () {
              widget.gotoswapping();
            }
          : widget.gotoreservedetails,
      child: Container(
        width: stationreservedetails ? double.infinity : 100,
        height: stationreservedetails ? 45 : 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xff3BF266),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Text(
          widget.stationreservedetails ? 'Confirm Reservation' : 'Reserve',
          style: TextStyle(
            fontSize: widget.stationreservedetails ? 20 : 16,
            color: Colors.white,
            // fontWeight: widget.stationreservedetails
            //     ? FontWeight.w700
            //     : FontWeight.w500,
            fontFamily: 'cairo',
          ),
        ),
      ),
    );
  }
}

class TitleStation extends StatelessWidget {
  int index;
  String place;
  String distance;
  String time;
  TitleStation(this.index, this.place, this.distance, this.time);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          place,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'cairo',
          ),
        ),
        Row(
          children: [
            Icon(Icons.electrical_services),
            Text(
              "${distance} km  (${time} min)",
              style: TextStyle(
                color: Colors.black.withOpacity(.4),
                fontFamily: 'mont',
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LeadingStation extends StatelessWidget {
  int index;
  LeadingStation(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            //index == 0 ?
            //'70 %' :
            'Full',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff3BF266),
              fontFamily: 'mont',
            ),
          ),
          Text(
            'charge',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'mont',
            ),
          ),
        ],
      ),
    );
  }
}
