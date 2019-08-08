

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../vote_comment_list_view.dart';

class VoteScreen extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Vode App Demo'),
      home: new MyVoteNestedListView(title: 'Flutter Vote App'),

    );
  }
}

class MyVoteNestedListView extends StatefulWidget {
  MyVoteNestedListView({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyVoteNestedListView createState() => new _MyVoteNestedListView();
}

ScrollController _controller;

class _MyVoteNestedListView extends State<MyVoteNestedListView> {

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  Color clr = Colors.lightGreen;
  _scrollListener() {

    if (_controller.offset > _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        clr = Colors.red;
      });
    }

    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        clr = Colors.lightGreen;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
          title: new Text('투표앱')
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:
        new Container(
          child:
          CustomScrollView(
            controller: _controller,
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("핫한 20개의 댓글",
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.green,
                      )),
                  background: Column(
                    children: <Widget>[VoteTitleWidget(), VotebButtonWidget()],
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: Text('댓글 $index'),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VoteCommentListViewApp()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), //
    );
  }

}


//Title Section
class VoteTitleWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      '대한민국 국민이라면 일본제품 불매운동은 찬성이다',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*3*/
            Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            Text('41'),
          ],

        )
    );
  }

}


// Button Widget
class VotebButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Icons.call, '찬성'),
          _buildButtonColumn(Icons.near_me, '반대'),
        ],
      ),
    );
  }

  Column _buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,

            ),
          ),
        ),
      ],
    );
  }
}