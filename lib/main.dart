

import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/second_page.dart';
import 'changeNotifier_provider.dart';
import 'stu_item.dart';
import 'theme_test_route.dart';
import 'main_list_view.dart';
import 'infinite_listview_page.dart';
import 'package:flutter_provider_demo/page/custom_listview_page.dart';
import 'progress_bar.dart';
import 'linear_layout_page.dart';
import 'flex_page.dart';
import 'wrap_page.dart';
import 'scaffold_route.dart';
import 'single_child_scrollview_page.dart';
import 'grid_route.dart';
import 'custom_scrollview_testroute.dart';
import 'scroll_controller_test_route.dart';
import 'scroll_notification_test_route.dart';
import 'future_build_page.dart';
import 'alert_dialog_route.dart';
import 'point_event_route.dart';
import 'guesture_detector_test_route.dart';
import 'event_bus_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
      routes: {
        "theme_page":(context)=>ThemeTestRoute(),
        'infinite_page':(context)=>InfiniteListView(),
        'custom_listview':(context)=>CustomListviewPage(),
        "second_page":(context){
          return SecondPage(content:ModalRoute.of(context).settings.arguments);
        },
        "progress_route":(context)=>ProgressRoute(),
        'linear_layout_route':(context)=>LineLayoutRoute(),
        'flex_page_route':(context)=>FlexRoute(),
        'wrap_route':(context)=>WrapRoute(),
        'scaffold_route':(context)=>ScaffoldRoute(),
        'single_child_scrollview':(context)=>SingleChildScrollViewTestRoute(),
        'grid_route':(context)=>GridRoute(),
        'custom_scrollview_testroute':(context)=> CustomScrollViewTestRoute(),
        'scroll_controller_test_route':(context)=> ScrollControllerTestRoute(),
        'scroll_notification_test_route':(context)=> ScrollNotificationTestRoute(),
        'future_build_page':(context)=>FutureBuildRoute(),
        'alert_dialog_route':(context)=>AlertDialogRoute(),
        'point_event_route':(context)=>PointEventRoute(),
        'gesture_detector_test_route':(context)=> GestureDetectorTestRoute(),
        'event_bus_test':(context)=> EventBusTest(),
      },
      home: MainListViewPage(),
    );
  }
}

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  String resultText = "测试数据";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resultText),
      ),
      body: ChangeNotifierProvider<StuModel>(
        data: StuModel(),
        child: Builder(builder: (context) {
          return Container(
              height: 1000,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "总价: ${ChangeNotifierProvider.of<StuModel>(context).allAge}"),
                    RaisedButton(
                      child: Text("添加商品"),
                      onPressed: () async{
                        //给购物车中添加商品，添加后总价会更新
                        ChangeNotifierProvider.of<StuModel>(context)
                            .add(StuItem(30));
                        var result = await Navigator.pushNamed(context, "second_page",arguments: "你好啊");
                        setState(() {
                          if(result != null)
                            resultText = result;
                        });
                      },
                    ),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
