import 'package:flutter/material.dart';
import 'package:new_flutter_project/conDB.dart';
import 'package:new_flutter_project/Json2Widget.dart';
import 'package:rxdart/rxdart.dart';

class ShowBuildWidget extends StatefulWidget {
  final String uID;
  final BehaviorSubject<Widget> widgetSubject = BehaviorSubject();

  ShowBuildWidget(this.uID);

  @override
  _ShowBuildWidgetState createState() => _ShowBuildWidgetState();
}

class _ShowBuildWidgetState extends State<ShowBuildWidget> {
  Json2Widget json2Widget = Json2Widget();
  Widget bodyWidget;

  @override
  void initState() {
    super.initState();
    updateWidget(widget.uID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: Center(
            child: StreamBuilder<Object>(
                stream: widget.widgetSubject.stream,
                initialData: Container(child: Text('Loading: ${widget.uID}')),
                builder: (context, AsyncSnapshot<Object> snapshot) {
                  return snapshot.data;
                }),
          )),
    );
  }

  updateWidget(String inputUID) async {
    // var returnStr = await insertQStr(jStr);
    var returnStr = await selectQStr(inputUID);
    bodyWidget = json2Widget.build(returnStr);
    widget.widgetSubject.add(bodyWidget);

    // return returnStr = await selectQStr(inputUID);
  }
}
