import 'package:flutter/material.dart';
import 'dart:convert';

class Json2Widget {
  Widget build(String inputJson) {
    Map<String, dynamic> decoded = json.decode(inputJson);
    return _build(decoded);
  }

  Widget _build(Map<String, dynamic> decoded) {
    Map<String, Widget Function(Map<String, dynamic>)> builderFactory = {
      'Column': _columnBuilder,
      'Row': _RowBuilder,
      'Text': _textBuilder,
      'RaisedButton': _raisedButtonBuilder,
    };

    String widgetName = decoded.keys.first;
    Map<String, dynamic> params = decoded[widgetName];

    return builderFactory[widgetName](params);
  }

  Widget _columnBuilder(Map<String, dynamic> params) {
    List<dynamic> mChildrenBuild = params['children'];
    List<Widget> mChild = <Widget>[];

    mChildrenBuild.forEach((child) {
      mChild.add(_build(child));
    });

    Column result = Column(
      children: mChild,
    );
    return result;
  }

  Widget _RowBuilder(Map<String, dynamic> params) {
    List<dynamic> mChildrenBuild = params['children'];
    List<Widget> mChild = <Widget>[];

    mChildrenBuild.forEach((child) {
      mChild.add(_build(child));
    });

    Row result = Row(
      children: mChild,
    );
    return result;
  }

  Widget _textBuilder(Map<String, dynamic> params) {
    Text result = Text(params['data'].toString());
    return result;
  }

  Widget _raisedButtonBuilder(Map<String, dynamic> params) {
    Widget mChild = _build(params['child']);

    RaisedButton result = RaisedButton(
      child: mChild,
      onPressed: () {},
    );
    return result;
  }
}
