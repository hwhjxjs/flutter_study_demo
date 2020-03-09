import 'package:flutter/material.dart';

class LineLayoutRoute extends StatefulWidget {
  @override
  _LineLayoutRouteState createState() => _LineLayoutRouteState();
}

class _LineLayoutRouteState extends State<LineLayoutRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('线性布局学习'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Text('hello world'),
                  Text('I am jack'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Text(" hello world",
                      style: TextStyle(
                        fontSize: 30.0,
                      )),
                  Text('I am jack'),
                ],
              ),
            ],
          ),
        ));
  }
}
