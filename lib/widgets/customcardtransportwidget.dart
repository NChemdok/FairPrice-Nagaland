import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fairpricenagaland/widgets/nodatafoundwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCardTransportWidget extends StatelessWidget {
  const CustomCardTransportWidget(
      {Key? key,
        required this.transportRoute,
        required this.transportBus,
        required this.transportSumo,
        required this.dateUpdated})
      : super(key: key);

  final List<String> transportRoute;
  final List<String> transportBus;
  final List<String> transportSumo;
  final List<Timestamp> dateUpdated;

  @override
  Widget build(BuildContext context) {
    if (transportRoute.isEmpty) {
      return NoDataFoundWidget();
    }
    return Container(
        color: Colors.black12,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5,0),
                child: ListView.builder(
                  itemCount: transportRoute.length,
                  itemExtent: 120,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 5,
                        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(children: <Widget>[
                            Expanded(
                              flex: 14,
                              child: Column(children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    ' ${transportRoute[index]}',
                                    style: TextStyle(
                                      color: Colors.black54,
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
                                    "Prices Updated on: ${formatTimeStamp(dateUpdated[index])}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 50,
                                        width: 100,
                                        child: Card(
                                          elevation: 10,
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Bus \n \u20B9 ${transportBus[index]}',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                      FontWeight.normal),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Card(
                                          elevation: 10,
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            height: 42,
                                            width: 100,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Sumo \n \u20B9 ${transportSumo[index]}',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.normal),
                                                textAlign: TextAlign.center,
                                              ),
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
