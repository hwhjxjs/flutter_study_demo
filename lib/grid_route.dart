import 'package:flutter/material.dart';

class GridRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('grid学习'),
      ),
      body:Container(
        child:GridView(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:3,
            childAspectRatio:1.0,
          ),
          children:<Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        ),
      ),
    );
  }
}