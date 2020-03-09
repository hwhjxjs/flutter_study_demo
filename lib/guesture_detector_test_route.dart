import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget{
  @override
  _GestureDetetorTestRouteState createState() => new _GestureDetetorTestRouteState();
}


class _GestureDetetorTestRouteState extends State<GestureDetectorTestRoute>{

  String _operation = "No Gesture detected!";//保存事件名

  @override
  Widget build(BuildContext context) {
    return Center(
      child:GestureDetector(
        child:Container(
          alignment:Alignment.center,
          color:Colors.blue,
          width:200.0,
          height:100.0,
          child:Text(_operation,
            style:TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onTap: ()=> updateText('Tap'),
        onDoubleTap: ()=>updateText('DoubleTap'),
        onLongPress: ()=>updateText('LongPress'),
      ),
    );
  }

  void updateText(String text){
    setState(() {
      _operation = text;
    });
  }

}