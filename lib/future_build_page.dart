import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/common/win_media.dart';

class FutureBuildRoute extends StatelessWidget {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网获取的数据");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('futureBuild学习'),
          leading: Icon(Icons.ac_unit),
        ),
        body: Container(
          width:winWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder(
                  future: mockNetworkData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text("Error:${snapshot.error}");
                      } else {
                        return Text("Contents:${snapshot.data}");
                      }
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ));
  }
}
