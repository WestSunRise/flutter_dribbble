import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_dribbble/screens/ShotScreen.dart';

class Routes {
  static Routes instance;
  static Router router;

  static Routes getInstance() {
    if (instance == null) {
      instance = new Routes();
    }

    return instance;
  }
  
  static void initRoutes() {
    router = new Router();
    router.define('/shots/:id', handler: shotHandler);
  }
  
  void navigateTo(BuildContext context, String route, { 
    bool replace = false,
    TransitionType transition = TransitionType.native,
    RouteTransitionsBuilder transitionBuilder,
    Duration transitionDuration = const Duration(milliseconds: 250)
  }) {
    router.navigateTo(
      context,
      route,
      transition: transition,
      transitionBuilder: transitionBuilder,
      replace: replace,
      transitionDuration: transitionDuration
    );
  }
}

var shotHandler = new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return new ShotScreen(shotId: params['id'].first);
});
