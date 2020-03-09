import 'package:flutter/material.dart';
import './common/constants.dart';

class SecondPage extends StatelessWidget {
  final String content;

  SecondPage({this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("传递过来的参数是$content"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Text("测试路由"),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, "返回的参数");
                  bus.emit("msg","nihao");
                },
                child: Text("点击返回上一个页面"),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(color: Colors.blue),
                ),
              ]))
            ],
          ),
        ));
  }
}
