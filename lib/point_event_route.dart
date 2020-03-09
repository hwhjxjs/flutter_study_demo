import 'package:flutter/material.dart';

class PointEventRoute extends StatefulWidget {
  @override
  _PointEventRouteState createState() => _PointEventRouteState();
}

class _PointEventRouteState extends State<PointEventRoute> {
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('point 测试路由'),
      ),
      body: Listener(
        child:Container(
          alignment:Alignment.center,
          color:Colors.blue,
          width:300.0,
          height:150.0,
          child:Text(_event?.toString()??"",style:TextStyle(color: Colors.white)),
        ),
      onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
      onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
      onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
      ),
    );
  }
}