import 'package:flutter/material.dart';

class StuItem{
  int age;


  StuItem(this.age);
}


class StuModel extends ChangeNotifier{
  final List _students = [];

  void add(StuItem item){
    _students.add(item);
    notifyListeners();
  }

  int get allAge{
    int alage = 0;
    _students.forEach((item){
      alage += item.age;
    });
    return alage;
  }
}