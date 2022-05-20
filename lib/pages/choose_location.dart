import 'package:flutter/material.dart';
import 'package:fairpricenagaland/services/getDataFirebase.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<String> locations = [
    'Chumukedima',
    'Dimapur',
    'Kiphire',
    'Kohima',
    'Longleng',
    'Mokokchung',
    'Mon',
    'Niuland',
    'Noklak',
    'Peren',
    'Phek',
    'Tuensang',
    'Shamator',
    'Wokha',
    'Zunheboto',
  ];

  void updateLocation(index) async {

    GetDataFirebase instance = GetDataFirebase(location: locations[index]);
    await instance.getLocation();

    //print(instance.location);
    Navigator.pop(context, {
      'location': instance.location,
      'vegetableName': instance.vegetableName,
      'vegetableUrl': instance.vegetableUrl,
      'vegetableRetail': instance.vegetableRetail,
      'vegetableWholesale': instance.vegetableWholesale,
      'vegetableTimeStamp': instance.vegetableTimeStamp,
      'fruitName': instance.fruitName,
      'fruitUrl': instance.fruitUrl,
      'fruitRetail': instance.fruitRetail,
      'fruitWholesale': instance.fruitWholesale,
      'fruitTimeStamp': instance.fruitTimeStamp,
      'fuelName': instance.fuelName,
      'fuelPrice': instance.fuelPrice,
      'fuelUrl': instance.fuelUrl,
      'fuelTimeStamp': instance.fuelTimeStamp,
      'serviceName': instance.serviceName,
      'serviceNumber': instance.serviceNumber,
      'serviceUrl': instance.serviceUrl,
      'serviceTimeStamp': instance.serviceTimeStamp,
      'transportRoute': instance.transportRoute,
      'transportBus': instance.transportBus,
      'transportSumo': instance.transportSumo,
      'transportTimeStamp': instance.transportTimeStamp,
      'essentialName': instance.essentialName,
      'essentialUrl': instance.essentialUrl,
      'essentialPrice': instance.essentialPrice,
      'essentialTimeStamp': instance.essentialTimeStamp,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Choose Location',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 1.8,
        children: locations.map((value) {
          return Container(
            margin: const EdgeInsets.fromLTRB(20, 15, 10, 10),
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 15,
                primary: Colors.white, // background
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ), // foreground
              ),
              onPressed: () {
                updateLocation(locations.indexOf(value));
              },
              icon: Icon(Icons.location_city, color: Colors.black54),
              label: Container(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  "${locations[locations.indexOf(value)]}",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
