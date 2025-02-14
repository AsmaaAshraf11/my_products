import 'package:flutter/material.dart';

// push and remove route
void pushAndRemoveRoute(BuildContext context, String route,
        {Object? arguments}) =>
    Navigator.of(context)
        .pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);

// push route
void pushRoute(BuildContext context, String route, {Object? arguments}) =>
    Navigator.of(context).pushNamed(route, arguments: arguments);
