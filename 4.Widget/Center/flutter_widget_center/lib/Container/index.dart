import 'package:flutter/material.dart';

/**
 *  Container Widget
 *  - 일반적인
 */

class ContainerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.amber[600],
          width: 48.0,
          height: 48.0,
        ),
    );
  }
}
