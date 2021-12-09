import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataFoundWidget extends StatefulWidget {
  @override
  _NoDataFoundWidgetState createState() => _NoDataFoundWidgetState();
}

class _NoDataFoundWidgetState extends State<NoDataFoundWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      elevation: 30,
      margin: const EdgeInsets.fromLTRB(40,60, 40, 130),
      clipBehavior: Clip.antiAlias,
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  '404',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 80),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(
                  'No Data Found !!!',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(
              'Data is No Longer Available / Not Yet Available',
              style: TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
            ],
          )),
    ));
  }
}
