import 'package:flutter/material.dart';

typedef void EventCallback(arg);


class EventBus {
  //私有构造函数
  EventBus._internal();


  static EventBus _singleton = new EventBus._internal();


  factory EventBus() => _singleton;


  var _emap = new Map<Object,List<EventCallback>>();


  void on(eventname,EventCallback f){
    if(eventname == null || f == null) return;
    _emap[eventname] ??= new List<EventCallback>();
    _emap[eventname].add(f);
  }

  void off(eventName,[EventCallback f]){
    var list = _emap[eventName];
    if(eventName == null || list == null)return;
    if(f == null){
      _emap[eventName] = null;
    }else{
      list.remove(f);
    }
  }


  void emit(eventName,[arg]){
    var list = _emap[eventName];
    if( list == null)return;
    int len = list.length -1 ;
    for (var i= len; i > -1; --i){
      list[i](arg);
    }
  }




}