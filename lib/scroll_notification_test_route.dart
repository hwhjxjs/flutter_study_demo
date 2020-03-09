import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      new _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('进度条'),
      ),
      body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                double progress = notification.metrics.pixels /
                    notification.metrics.maxScrollExtent;
                setState(() {
                  _progress = "${(progress * 100).toInt()}%";
                });
                print("BottomEdge:${notification.metrics.extentAfter == 0}");
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ListView.builder(
                      itemExtent: 50.0,
                      itemCount: 100,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Text("$index"),
                        );
                      })),
                  CircleAvatar(
                    radius: 30.0,
                    child: Text(_progress),
                    backgroundColor: Colors.black54,
                  ),
                ],
              ))),
    );
  }
}
