import 'package:demo/demo.dart';
import 'package:flutter/material.dart';
import 'package:demo/home.dart';
import 'package:provider/provider.dart';

import 'impl/impl.dart';
import 'impl/prefs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          builder: (context) => DemoServices(
              interface: WebInterface(),
              prefs: WebPrefs()
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

