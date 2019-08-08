import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  BuildContext context;

  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    return new Scaffold(
        body: new SingleChildScrollView(
            child: new Container(
              padding: new EdgeInsets.all(16.0),
              child: new Column(
                children: <Widget>[
                  Text("test")
                  ]
              )
            )
        )
    );
  }
}
