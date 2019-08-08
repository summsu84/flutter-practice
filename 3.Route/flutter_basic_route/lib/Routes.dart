import 'package:flutter/material.dart';
import 'package:flutter_basic_route/screen/home/index.dart';
import 'package:flutter_basic_route/screen/login/index.dart';
import 'package:flutter_basic_route/screen/main/index.dart';



class Routes {

  var routes = <String, WidgetBuilder>{
    "/Screen1": (BuildContext context) => new VoteScreen(),
    "/Screen2": (BuildContext context) => new LoginScreen(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Flutter Flat App",
      home: new MyHomePage(title:'test'),
      routes: routes,
    ));
  }
}
