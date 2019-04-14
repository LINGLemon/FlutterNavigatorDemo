import 'package:flutter/material.dart';
import 'package:flutter_routes_demo/page1.dart';
import 'package:flutter_routes_demo/page2.dart';
import 'package:flutter_routes_demo/page3.dart';
import 'package:flutter_routes_demo/page4.dart';

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
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        'page1': (BuildContext context) => Page1(),
        'page2': (BuildContext context) => Page2(),
        'page3': (BuildContext context) => Page3(),
        'page4': (BuildContext context) => Page4(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nihao'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              value: byName,
              title: Text('${byName ? '' : '不'}通过路由名跳转'),
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              },
            ),
            _item('route page1', Page1(), 'page1'),
            _item('route page2', Page2(), 'page2'),
            _item('route page3', Page3(), 'page3'),
            _item('route page4', Page4(), 'page4'),
          ],
        ),
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
