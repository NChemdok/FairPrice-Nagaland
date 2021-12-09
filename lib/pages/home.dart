import 'package:flutter/material.dart';
import 'package:fairpricenagaland/widgets/customcardwidget.dart';
import 'package:fairpricenagaland/widgets/customcardtransportwidget.dart';
import 'package:fairpricenagaland/widgets/customcardfuelwidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Map data = {};

  List<String> travelRouteNames = [
    "Kohima - Dimapur",
    "Kohima - Tuensang",
    "Kohima - Phek",
    "Kohima - Mokokchung",
    "Kohima - Zunheboto",
    "Kohima - Wokha",
    "Kohima - Mon",
  ];

  List<String> otherNames = [];

  List<String> fruitImages = [
    "https://i.ibb.co/ZVL6JZt/apple-fruit-500x500.jpg",
    "https://i.ibb.co/16Y9CKz/A-bunch-of-bananas-Clipping-path-included.jpg",
    "https://i.ibb.co/6PSdSHZ/Cranberry.jpg",
    "DragonFruit",
    "Fig",
    "Guava",
    "Pineapple",
    "Mango",
    "Papaya",
    "Kiwi",
  ];

  List<String> fuelNames = [
    "Petrol",
    "Diesel",
    "Kerosene",
    "LPG",
    "CNG",
  ];

  List<String> fuelImages = [
    "https://www.sunnewsonline.com/wp-content/uploads/2020/09/petrol.jpg",
    "https://i2.wp.com/agfax.com/wp-content/uploads/gas-diesel-pump-DFiphone-1.jpg",
    "Kerosene",
    "LPG",
    "CNG",
  ];

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

  List<String> dateUpdated = [
    "10-06-2021",
    "10-06-2021",
    "10-06-2021",
    "10-06-2021",
    "10-06-2021",
    "10-06-2021",
    "10-06-2021",
    "10-06-2021",
    "10-06-2021",
    "10-06-2021"
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
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            elevation: 0,
            bottom: const TabBar(
              isScrollable: true,
              labelColor: Colors.red,
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
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Daily Wage"),
                  ),
                ),
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
                    primary: Colors.redAccent, // background
                    onPrimary: Colors.red,
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
                        'fuelPrice': result['fuelPrice'],
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
                  productNames: fuelNames,
                  productImages: fuelImages,
                  data: data,
                  dateUpdated: dateUpdated),
              CustomCardTransportWidget(
                  productNames: travelRouteNames,
                  data: data,
                  dateUpdated: dateUpdated),
              CustomCardWidget(
                  productNames: otherNames,
                  productImages: vegetableImages,
                  productRetail: data['vegetableRetail'],
                  productWholesale: data['vegetableWholesale'],
                  //data: data,
                  dateUpdated: data['fruitTimeStamp']),
              CustomCardWidget(
                  productNames: otherNames,
                  productImages: vegetableImages,
                  productRetail: data['vegetableRetail'],
                  productWholesale: data['vegetableWholesale'],
                  //data: data,
                  dateUpdated: data['fruitTimeStamp']),
            ],
          ), /**/
        ),
      ),
    );
  }
}
