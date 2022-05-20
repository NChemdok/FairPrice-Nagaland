import 'package:flutter/material.dart';
import 'package:fairpricenagaland/widgets/customcardwidget.dart';
import 'package:fairpricenagaland/widgets/customcardtransportwidget.dart';
import 'package:fairpricenagaland/widgets/customcardfuelwidget.dart';
import 'package:fairpricenagaland/widgets/customcardessentialwidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Map data = {};

  List<String> vegetableImages = [
    "https://i.ibb.co/FHQsCcb/Asparagus.jpg",
    "https://i.ibb.co/kcMLrRP/Beetroot.jpg",
    "https://i.ibb.co/MRYyrVg/Broccoli.jpg",
    "https://i.ibb.co/qCcB6Pq/Cabbage.jpg",
    "https://i.ibb.co/FXm1RYy/Carrot.jpg",
    "https://i.ibb.co/B3dBvFx/Corn.jpg",
    "https://i.ibb.co/CHbPf0D/Cucumber.jpg",
    "https://i.ibb.co/H4pz8t4/Green-Pepper.jpg",
    "https://i.ibb.co/Rvhwf7C/Potato.jpg",
    "https://i.ibb.co/zrnhmdD/Tomato.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    //print(data['productName']);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[500],
            elevation: 5,
            bottom: const TabBar(
              isScrollable: true,
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Vegetables"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Fruits"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Fuels"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Transport"),
                  ),
                ),
//                Tab(
//                  child: Align(
//                    alignment: Alignment.center,
//                    child: Text("Emergency Numbers"),
//                  ),
//                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Other Essentials"),
                  ),
                ),
              ],
            ),
            title: const Text('FairPrice Nagaland'),
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.transparent,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ), // foreground
                  ),
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'vegetableName': result['vegetableName'],
                        'vegetableUrl': result['vegetableUrl'],
                        'vegetableRetail': result['vegetableRetail'],
                        'vegetableWholesale': result['vegetableWholesale'],
                        'vegetableTimeStamp': result['vegetableTimeStamp'],
                        'fruitName': result['fruitName'],
                        'fruitUrl': result['fruitUrl'],
                        'fruitRetail': result['fruitRetail'],
                        'fruitWholesale': result['fruitWholesale'],
                        'fruitTimeStamp': result['fruitTimeStamp'],
                        'busFare': result['busFare'],
                        'sumoFare': result['sumoFare'],
                        'fuelName': result['fuelName'],
                        'fuelPrice': result['fuelPrice'],
                        'fuelUrl': result['fuelUrl'],
                        'fuelTimeStamp': result['fuelTimeStamp'],
                        'serviceName': result['serviceName'],
                        'serviceNumber': result['serviceNumber'],
                        'serviceUrl': result['serviceUrl'],
                        'serviceTimeStamp': result['serviceTimeStamp'],
                        'transportRoute': result['transportRoute'],
                        'transportBus': result['transportBus'],
                        'transportSumo': result['transportSumo'],
                        'transportTimeStamp': result['transportTimeStamp'],
                        'essentialName': result['essentialName'],
                        'essentialPrice': result['essentialPrice'],
                        'essentialUrl': result['essentialUrl'],
                        'essentialTimeStamp': result['essentialTimeStamp'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location, color: Colors.white),
                  label: Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      data['location'],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              CustomCardWidget(
                  productNames: data['vegetableName'],
                  productImages: data['vegetableUrl'],
                  productRetail: data['vegetableRetail'],
                  productWholesale: data['vegetableWholesale'],
                  dateUpdated: data['vegetableTimeStamp']),

              CustomCardWidget(
                  productNames: data['fruitName'],
                  productImages: data['fruitUrl'],
                  productRetail: data['fruitRetail'],
                  productWholesale: data['fruitWholesale'],
                  dateUpdated: data['fruitTimeStamp']),

              CustomCardFuelWidget(
                  productNames: data['fuelName'],
                  productImages: data['fuelUrl'],
                  productPrice: data['fuelPrice'],
                  dateUpdated: data['fuelTimeStamp']),
              CustomCardTransportWidget(
                  transportRoute: data['transportRoute'],
                  transportBus: data['transportBus'],
                  transportSumo: data['transportSumo'],
                  dateUpdated: data["transportTimeStamp"]),
//              CustomCardEmergencyNumberWidget(
//                  serviceNames: data['serviceName'],
//                  serviceImages: data['serviceUrl'],
//                  serviceNumber: data['serviceNumber'],
//                  dateUpdated: data['serviceTimeStamp']),
              CustomCardEssentialWidget(
                  productNames: data['essentialName'],
                  productImages: data['essentialUrl'],
                  productPrice: data['essentialPrice'],
                  dateUpdated: data['essentialTimeStamp']),
            ],
          ), /**/
        ),
      ),
    );
  }
}
