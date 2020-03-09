import 'package:flutter/material.dart';
import './common/event_bus.dart';
import './common/constants.dart';


class EventBusTest extends StatefulWidget {
  @override
  _EventBusTestState createState() => _EventBusTestState();
}

class _EventBusTestState extends State<EventBusTest> {
    String content =  "点击";
  @override
  Widget build(BuildContext context) {

    bus.on("msg", (arg){
      print("收到的参数{$arg}");
      setState(() {
        content = arg;
      });
    });

    return Scaffold(
      appBar:AppBar(
        title:Text('EventBus测试'),
      ),
      body:Container(
        child:RaisedButton(
          child: Text(content),
          onPressed: (){
              Navigator.pushNamed(context, "second_page");
              bus.emit("msg","test eventBus");
          },
        ),
      ),
    );
  }
}



