/*
 * @Author: your name
 * @Date: 2020-03-02 14:46:24
 * @LastEditTime: 2020-03-07 13:40:16
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /flutter_provider_demo/lib/alert_dialog_route.dart
 */

import 'package:flutter/material.dart';

class AlertDialogRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alertDialog演示'),
      ),
      body: Container(
        alignment:Alignment.center,
        child: RaisedButton(
          child: Text('对话框1'),
          onPressed: () async {
            bool delete = await showDeleteConfirmDialog1(context);
            if (delete == null) {
              print("取消删除");
            } else {
              print("已确定删除");
            }
          },
        ),
      ),
    );
  }

  /**
   * @description: 
   * @param {type} 
   * @return: 
   */
  Widget getDialogWidget(context) {
    Scaffold(
        appBar: AppBar(
          title: Text('alertDialog学习'),
        ),
        body: AlertDialog(
          title: Text('提示'),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        ));
  }

  /**
   * @description: 确定是否删除对话框
   * @param {type} 
   * @return: 
   */
  Future<bool> showDeleteConfirmDialog1(context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("取消")),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("删除"),
            ),
          ],
        );
      },
    );
  }
}
