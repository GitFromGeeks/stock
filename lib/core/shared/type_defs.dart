import 'package:flutter/material.dart' show BuildContext, Widget;

typedef JSON = Map<String, dynamic>;
typedef QueryParams = Map<String, String>;
typedef RouteBuilder = Widget Function(BuildContext);
typedef ItemBuilder<T> = Widget Function(BuildContext, T);
