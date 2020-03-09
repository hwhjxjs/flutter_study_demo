import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  List tabs = ['新闻', '历史', '图片'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('App Name'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.share), onPressed: () {})
            ],
            bottom: TabBar(
              controller: _tabController,
              tabs: tabs.map((e) {
                return Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(e),
                );
              }).toList(),
            )),
        drawer: new Drawer(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.home),
                iconSize: 50,
                color: Colors.blue,
                onPressed: () {},
              ),
              SizedBox(), //中间位置空出
              IconButton(
                icon: Icon(Icons.business),
                iconSize: 50,
                color: Colors.blue,
                onPressed: () {},
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
          ),
        ),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: _onAdd),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              child: Text(
                e,
                textScaleFactor: 5,
              ),
              alignment: Alignment.center,
            );
          }).toList(),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}
