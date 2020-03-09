import 'package:flutter/material.dart';


class ScrollControllerTestRoute extends StatefulWidget{

  @override 
  ScrollControllerTestRouteState createState(){
    return new ScrollControllerTestRouteState();
  }
}


class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute>{
  ScrollController _scrollController= new ScrollController();
  bool showToTopBtn = false; //是否显示'返回到顶部'按钮


  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
      print(_scrollController.offset);
      if(_scrollController.offset < 1000 && showToTopBtn)
      {
        setState(() {
          showToTopBtn = false;
        });
        
      }else if(_scrollController.offset >= 1000 && !showToTopBtn){
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(
        title:Text('滚动控制'),
      ),
      body:Scrollbar(
        child:ListView.builder(
          itemCount: 100,
          itemExtent: 50.0,
          controller: _scrollController,
          itemBuilder: (context,index){
            return ListTile(
              title: Text('$index'),
            );
          })
      ),
      floatingActionButton: !showToTopBtn ? null:FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _scrollController.animateTo(.0, duration: Duration(microseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }
}