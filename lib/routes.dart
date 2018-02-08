import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'login/login.dart';
import 'home/dashboard.dart';


class Routes {
  static final Router _router = new Router();

  static void initRoutes() {
    _router.define('/login',
      handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new Login();
        }
      ),
    );

    _router.define('/dashboard',
      handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return new Dashboard();
        }
      ),
    );
  }
  static void navigateTo(context, String route, {TransitionType transition, bool replace}) {
    _router.navigateTo(context, route, transition: transition, replace: replace);
  }
}