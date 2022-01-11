import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fairpricenagaland/widgets/nodatafoundwidget.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCardEmergencyNumberWidget extends StatelessWidget {
  const CustomCardEmergencyNumberWidget(
      {Key? key,
      required this.serviceNames,
      required this.serviceImages,
      required this.serviceNumber,
      required this.dateUpdated})
      : super(key: key);

  final List<String> serviceNames;
  final List<String> serviceImages;
  final List<String> serviceNumber;
  final List<Timestamp> dateUpdated;

  @override
  Widget build(BuildContext context) {
    if (serviceNames.isEmpty) {
      return NoDataFoundWidget();
    }
    return Container(
        color: Colors.black12,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: ListView.builder(
                  itemCount: serviceNames.length,
                  itemExtent: 130,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 5,
                        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(children: <Widget>[
                            Container(
                                child: Expanded(
                              flex: 6,
                              child: Card(
                                elevation: 10,
                                margin: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: FadeInImage(
                                    height: 200,
                                    width: 200,
                                    placeholder: AssetImage(
                                        'assets/images/utility/transparentLoader.gif'),
                                    image: NetworkImage(serviceImages[index]),
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/utility/noimagefound.png',
                                          fit: BoxFit.fill);
                                    },
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )),
                            Expanded(
                              flex: 14,
                              child: Column(children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  width: double.infinity,
                                  child: Text(
                                    '${serviceNames[index]}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  width: double.infinity,
                                  child: Text(
                                    "Number Updated on: ${formatTimeStamp(dateUpdated[index])}",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10.0, bottom: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 50,
                                        width: 150,
                                        child: Card(
                                          elevation: 10,
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '+91 ${serviceNumber[index]}',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 90,
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 10,
                                            primary: Colors.red, // background
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5),
                                            ), // foreground
                                          ),
                                          onPressed: () {
                                            launch(
                                                "tel:+91${serviceNumber[index].trim()}");
                                          },
                                          icon: Icon(Icons.phone,
                                              color: Colors.white),
                                          label: Container(
                                            child: Text(
                                              "Call",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            )
                          ]),
                        ));
                  },
                ),
              ),
            )
          ],
        ));
  }

  formatTimeStamp(Timestamp dateUpdated) {
    var date = dateUpdated.toDate();
    var formattedDate = "${date.day}-${date.month}-${date.year}";
    return formattedDate;
  }
}
