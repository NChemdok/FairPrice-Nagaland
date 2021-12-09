import 'package:cloud_firestore/cloud_firestore.dart';

class GetDataFirebase {
  String location;

  // Vegetables Data
  late List<String> vegetableName;
  late List<String> vegetableUrl;
  late List<String> vegetableRetail;
  late List<String> vegetableWholesale;
  late List<Timestamp> vegetableTimeStamp;

  //Fruits Data
  late List<String> fruitName;
  late List<String> fruitUrl;
  late List<String> fruitRetail;
  late List<String> fruitWholesale;
  late List<Timestamp> fruitTimeStamp;

  late String busFare;
  late String sumoFare;
  late String fuelPrice;

  GetDataFirebase({required this.location});

  Future<void> getLocation() async {
    var databaseInstance = FirebaseFirestore.instance;

    var returnData = await loadData(databaseInstance);

    location = location;
    vegetableName = returnData[0];
    vegetableUrl = returnData[1];
    vegetableRetail = returnData[2];
    vegetableWholesale = returnData[3];
    vegetableTimeStamp = returnData[4];
    fruitName = returnData[5];
    fruitUrl = returnData[6];
    fruitRetail = returnData[7];
    fruitWholesale = returnData[8];
    fruitTimeStamp = returnData[9];
    busFare = "400";
    sumoFare = "900";
    fuelPrice = "300";
  }

  Future<List<dynamic>> loadData(FirebaseFirestore databaseInstance) async {
    // Vegetables Data
    List<String> vegetableNameDynamicData = [];
    List<String> vegetableUrlDynamicData = [];
    List<String> vegetableRetailDynamicData = [];
    List<String> vegetableWholesaleDynamicData = [];
    List<Timestamp> vegetableTimeStampDynamicData = [];

    //Fruits Data
    List<String> fruitNameDynamicData = [];
    List<String> fruitUrlDynamicData = [];
    List<String> fruitRetailDynamicData = [];
    List<String> fruitWholesaleDynamicData = [];
    List<Timestamp> fruitTimeStampDynamicData = [];

    DocumentSnapshot districtInstance = await databaseInstance
        .collection("prices")
        .doc(location.toLowerCase())
        .get();

    if (districtInstance.exists) {
      try {
        dynamic fruits = districtInstance.get(FieldPath(['Fruits'])).toList();

        for (var fruit in fruits) {
          var fruitList = fruit.entries.toList();
          //Fetch Data
          String _currentItem = fruitList[0].key;
          String retail = fruit[_currentItem][0];
          String wholesale = fruit[_currentItem][1];
          String imageUrl = fruit[_currentItem][2];
          Timestamp timeStamp = fruit[_currentItem][3];

          //Load Data to List
          fruitNameDynamicData.add(fruitList[0].key);
          fruitUrlDynamicData.add(imageUrl);
          fruitRetailDynamicData.add(retail);
          fruitWholesaleDynamicData.add(wholesale);
          fruitTimeStampDynamicData.add(timeStamp);
        }
      } on StateError catch (e) {
        print('No nested field exists!');
      }

      try {
      dynamic vegetables = districtInstance.get(FieldPath(['Vegetables'])).toList();

      for (var vegetable in vegetables) {
        var vegetableList = vegetable.entries.toList();
        //Fetch Data
        String _currentItem = vegetableList[0].key;
        String retail = vegetable[_currentItem][0];
        String wholesale = vegetable[_currentItem][1];
        String imageUrl = vegetable[_currentItem][2];
        Timestamp timeStamp = vegetable[_currentItem][3];

        //Load Data to List
        vegetableNameDynamicData.add(vegetableList[0].key);
        vegetableUrlDynamicData.add(imageUrl);
        vegetableRetailDynamicData.add(retail);
        vegetableWholesaleDynamicData.add(wholesale);
        vegetableTimeStampDynamicData.add(timeStamp);
      }
      } on StateError catch (e) {
        print('No nested field exists!');
      }
    }

//    querySnapshot.forEach((doc) {
//
//      print('$location');
//      print(doc.data());
//
//      doc['Fruits'].forEach((fruit) {
//        var fruitList = fruit.entries.toList();
//
//        //Fetch Data
//        String _currentItem = fruitList[0].key;
//        String retail = fruit[_currentItem][0];
//        String wholesale = fruit[_currentItem][1];
//        String imageUrl = fruit[_currentItem][2];
//        Timestamp timeStamp = fruit[_currentItem][3];
//
//        //Load Data to List
//        fruitNameDynamicData.add(fruitList[0].key);
//        fruitUrlDynamicData.add(imageUrl);
//        fruitRetailDynamicData.add(retail);
//        fruitWholesaleDynamicData.add(wholesale);
//        fruitTimeStampDynamicData.add(timeStamp);
//        //print("$_currentItem : Retail = $retail : Wholesale = $wholesale");
//      });
//
//      doc['Vegetables'].forEach((vegetable) {
//        var vegetableList = vegetable.entries.toList();
//        //Fetch Data
//        String _currentItem = vegetableList[0].key;
//        String retail = vegetable[_currentItem][0];
//        String wholesale = vegetable[_currentItem][1];
//        String imageUrl = vegetable[_currentItem][2];
//        Timestamp timeStamp = vegetable[_currentItem][3];
//
//        //Load Data to List
//        vegetableNameDynamicData.add(vegetableList[0].key);
//        vegetableUrlDynamicData.add(imageUrl);
//        vegetableRetailDynamicData.add(retail);
//        vegetableWholesaleDynamicData.add(wholesale);
//        vegetableTimeStampDynamicData.add(timeStamp);
//        //print("$_currentItem : Retail = $retail : Wholesale = $wholesale");
//      });
//    });

    return [
      //Vegetable Data
      vegetableNameDynamicData,
      vegetableUrlDynamicData,
      vegetableRetailDynamicData,
      vegetableWholesaleDynamicData,
      vegetableTimeStampDynamicData,

      //Fruit Data
      fruitNameDynamicData,
      fruitUrlDynamicData,
      fruitRetailDynamicData,
      fruitWholesaleDynamicData,
      fruitTimeStampDynamicData,
    ];
  }
}