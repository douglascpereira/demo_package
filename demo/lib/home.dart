import 'package:demo/demo.dart';
import 'package:demo/prefs.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  void initState() {
    super.initState();

    _loadData();
  }

  _loadData() async {
    Prefs prefs = DemoServices.get(context).prefs;
    int count = await prefs.getInt("count");
    setState(() {
      print("Count prefs: $count");
      _counter = count;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;

      Prefs prefs = DemoServices.get(context).prefs;
      prefs.setInt("count", _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text("Google"),
              onPressed: _onClickGoogle,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _onClickGoogle() {

    DemoServices services = DemoServices.get(context);

    services.interface.launch("https://google.com");
  }
}
