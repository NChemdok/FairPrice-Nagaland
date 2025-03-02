import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fairpricenagaland/services/getDataFirebase.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    GetDataFirebase instance = GetDataFirebase(location: "Kohima");

    await instance.getLocation();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
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
      'fuelUrl': instance.fuelUrl,
      'fuelPrice': instance.fuelPrice,
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
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}