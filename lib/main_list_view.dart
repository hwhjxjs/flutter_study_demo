import 'package:flutter/material.dart';
import 'package:flutter_provider_demo/model/menu_item.dart';
import 'package:flutter_provider_demo/common/win_media.dart';

class MainListViewPage extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem("第二个页面", "second_page", "测试跳转到第二个页面"),
    MenuItem("theme页面", "theme_page", "theme页面"),
    MenuItem("上拉加载更多", "infinite_page", "上拉加载更多"),
    MenuItem("自定义列表", "custom_listview", "跳转到自定义列表"),
    MenuItem("进度条",'progress_route','跳转到进图条页面'),
    MenuItem('线性布局', 'linear_layout_route', 'column和row的学习和掌握'),
    MenuItem('flex布局', 'flex_page_route', 'flex布局学习'),
    MenuItem('wrap布局', 'wrap_route', 'wrap布局学习'),
    MenuItem('Scaffold布局', 'scaffold_route', 'Scaffold布局学习'),
    MenuItem('singleChildScrollView', 'single_child_scrollview', 'SingleChildScrollView'),
    MenuItem("grid演示", 'grid_route', 'grid演示'),
    MenuItem('自定义ScrollView', 'custom_scrollview_testroute', '自定义Scrollview'),
    MenuItem('自定义滚动控制', 'scroll_controller_test_route', '滚动控制'),
    MenuItem('滚动控制进度条', 'scroll_notification_test_route', '滚动进度'),
    MenuItem('futureBuild学习','future_build_page','futureBuild'),
    MenuItem('alertDialog学习', 'alert_dialog_route', 'alertDialog学习'),
    MenuItem('point event学习', 'point_event_route', '原始指针事件处理'),
    MenuItem('手势识别', 'gesture_detector_test_route', '手势识别'),
    MenuItem('eventbus总线测试', 'event_bus_test', 'eventbus测试'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('功能列表'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return CustomListItem(
              item: menuItems[index],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              color: Colors.grey,
            );
          },
          itemCount: menuItems.length),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: winWidth(context),
      child: new FlatButton(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 0.0, 0),
          onPressed: () {
            String routeName = item.routeName;
            print("点击了$routeName");
            Navigator.pushNamed(context, routeName);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_menuWidget(item), _moreWidget()],
          )),
    );
  }

  Widget _menuWidget(item) {
    return Row(
      children: <Widget>[
        Text(item.title),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        Text(item.description),
      ],
    );
  }

  Widget _moreWidget() {
    return Icon(Icons.arrow_right);
  }
}
