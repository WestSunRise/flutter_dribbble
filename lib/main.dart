import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_dribbble/app.dart';
import 'package:flutter_dribbble/routes.dart';

void main() => runApp(new App());

class App extends StatelessWidget {

  final Router router = new Router();
  
  App() {
    configureRouter(router);
  }
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Dribbble',
      home: new DribbbleApp(),
      onGenerateRoute: router.generator
    );
  }
}
