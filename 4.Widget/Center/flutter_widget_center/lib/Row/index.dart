import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Center(
            child: Row(children: [
              Text(
                'Hello World',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                'Hello World2',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )
            ])));
  }
}
