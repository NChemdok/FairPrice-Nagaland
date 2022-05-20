import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fairpricenagaland/widgets/nodatafoundwidget.dart';

class CustomCardEssentialWidget extends StatelessWidget {
  const CustomCardEssentialWidget(
      {Key? key,
        required this.productNames,
        required this.productImages,
        required this.productPrice,
        required this.dateUpdated})
      : super(key: key);

  final List<String> productNames;
  final List<String> productImages;
  final List<String> productPrice;
  final List<Timestamp> dateUpdated;

  @override
  Widget build(BuildContext context) {
    if (productNames.isEmpty) {
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
                  itemCount: productNames.length,
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
                                        image: NetworkImage(productImages[index]),
                                        imageErrorBuilder:  (context, error, stackTrace) {
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
                                    '${productNames[index]}',
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
                                  margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
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
                                                  '\u20B9 ${productPrice[index]} / kg',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                      FontWeight.normal),
                                                  textAlign: TextAlign.center,
                                                )),
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
