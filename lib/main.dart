import 'package:flutter/material.dart';
import 'package:new_flutter_project/ShowBuildWidget.dart';
import 'package:new_flutter_project/conDB.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textCtr.text = "-LgGwqW9fOclCAKOcPhV";
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textCtr,
            ),
            RaisedButton(
              child: Text('Build Widget'),
              onPressed: () {
                //ToDo ...

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ShowBuildWidget(textCtr.text)));
              },
            )
          ],
        ),
      ),
    );
  }
}
