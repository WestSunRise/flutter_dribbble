import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_dribbble/screens/ShotScreen.dart';

var shotHandler = new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print('shot handler params: ${params['id']}');
  return new ShotScreen();
});

void configureRouter(Router router) {
  router.define(
    '/shots/:id',
    handler: shotHandler
  );
}