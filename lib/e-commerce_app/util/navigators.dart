import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

navigatePush(BuildContext context, Widget widget) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => widget));
}

navigatePushIos(BuildContext context, Widget widget) {
  return Navigator.push(
      context, CupertinoPageRoute(builder: (context) => widget));
}

navigatePop(BuildContext context) {
  return Navigator.pop(context);
}