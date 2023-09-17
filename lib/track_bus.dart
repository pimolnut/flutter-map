import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testnewmap/display_place.dart';
import 'package:testnewmap/location.dart';

///////////////////////////page 3/////////////////////////////////////////
/////show bus stop and each location + travel time (bus number is 777)//////////

double myLongDouble = double.parse(myLongStr);
double myLatDouble = double.parse(myLatStr);
List<Map<String, dynamic>> bus = [
  {'id': 0, 'name': 'แยกสนามบิน', 'price': 0.0},
  {'id': 1, 'name': 'แยกร่มเกล้า - ลาดกระบัง', 'price': 9.0},
  {'id': 2, 'name': 'สำนักงานเขตลาดกระบัง', 'price': 4.0},
  {'id': 3, 'name': 'สน.ลาดกระบัง', 'price': 5.0},
  {'id': 4, 'name': 'วัดปลูกศรัทธา(วัด 4)', 'price': 5.0},
  {'id': 5, 'name': 'แยกเจ้าคุณทหาร', 'price': 5.0},
  {'id': 6, 'name': 'ตรงข้าม FBT', 'price': 5.0},
  {'id': 7, 'name': 'คณะเทคโนโลยีการเกษตร', 'price': 5.0},
  {'id': 8, 'name': 'ประตูทางโค้งคณะสถาปัตยกรรมศาสตร์', 'price': 5.0},
  {'id': 9, 'name': 'ป้ายใหญ่คณะวิศวกรรมศาสตร์', 'price': 5.0},
  {'id': 10, 'name': 'ตรงข้ามคณะวิทย์', 'price': 5.0},
  {'id': 11, 'name': 'ตึกอธิการบดี', 'price': 5.0},
  {'id': 12, 'name': 'คณะ IT', 'price': 5.0},
  {'id': 13, 'name': 'ทางออกมอเตอร์เวย์', 'price': 5.0},
  {'id': 14, 'name': 'แอร์พอร์ตลิ้งค์ลาดกระบัง', 'price': 5.0},
];

class BusStop extends StatefulWidget {
  const BusStop({super.key});

  @override
  State<BusStop> createState() => _BusStopState();
}

class _BusStopState extends State<BusStop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromRGBO(10, 26, 127, 0.751),
      ),
      body: Stack(children: [
        Positioned(
          top: 16.0,
          left: 16.0,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle navigation here to go back to the previous page.
              Navigator.of(context).pop();
            },
          ),
        ),
        ShowMapAndMark(),
        DraggableScrollableSheet(
          initialChildSize: 0.35,
          minChildSize: 0.3,
          maxChildSize: 1,
          snapSizes: [0.5, 1],
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color:
                  Color.fromRGBO(12, 25, 103, 0.671), // 0.6 = transparent color
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                controller: scrollController,
                itemCount: bus.length,
                itemBuilder: (BuildContext context, int index) {
                  final busData = bus[index];
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          Container(
                            child: const Column(
                              children: [
                                //show pull up bar
                                SizedBox(
                                  width: 50,
                                  child: Divider(
                                    thickness: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  //tell 2 tracker
                                  const Text(
                                    '777 ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "FCIconic",
                                      fontSize: 20,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/img/GO_RBG_NEW.png',
                                    height: 30,
                                  ),
                                  //tell dest
                                  const Text(
                                    ' ARL ลาดกระบัง',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "FCIconic",
                                      fontSize: 20,
                                    ),
                                  ),
                                  //tell time
                                  const Text(
                                    ' 9 นาที',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "FCIconic",
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShowMapAndMark()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  onPrimary: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'ยืนยัน',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "FCIconic",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  //DATA of bus stop
                  return Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    color: Color.fromRGBO(10, 26, 127, 0.486),
                    child: ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.all(5),
                      leading: Image.asset(
                        'assets/img/locationTransparen_RBG_NEW.png',
                        height: 120,
                      ),
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                busData['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "FCIconic",
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: 5,
                            ),
                            child: Divider(
                              height: 7,
                              thickness: 2,
                              color: Color.fromARGB(255, 119, 120, 121),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ]),
    );
  }
}

class ShowMapAndMark extends StatefulWidget {
  const ShowMapAndMark({super.key});

  @override
  State<ShowMapAndMark> createState() => _ShowMapAndMarkState();
}

class _ShowMapAndMarkState extends State<ShowMapAndMark> {
  static const LatLng source = LatLng(13.72987831788902, 100.77799696840856);
  static LatLng dest = LatLng(myLatDouble, myLongDouble);

  final Polyline _kPolyline = Polyline(
    polylineId: PolylineId('_kPolyline'),
    color: const Color(0xFF7B61FF),
    width: 6,
    points: [
      LatLng(source.latitude, source.longitude),
      LatLng(dest.latitude, dest.longitude)
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(13.72976753118423, 100.75748581588128),
          zoom: 10.0,
        ),
        //markers: {_GoogleMark},
        polylines: {
          _kPolyline,
        },
        minMaxZoomPreference: MinMaxZoomPreference(10, 15),
        markers: {
          Marker(
            markerId: MarkerId("source"),
            infoWindow: InfoWindow(title: 'KMITL'),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(source.latitude, source.longitude),
            draggable: true,
          ),
          Marker(
            markerId: MarkerId("des"),
            infoWindow: InfoWindow(title: 'APL ลาดกระบัง'),
            position: LatLng(dest.latitude, dest.longitude),
            draggable: true,
          ),
        },
      ),
    );
  }
}