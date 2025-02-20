import 'package:flutter/material.dart' show WidgetsFlutterBinding;
import 'package:flutter/widgets.dart' show runApp;

import 'app_bootstrapper.dart' show AppBootstrapper;
import 'my_app.dart' show MyApp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBootstrapper.init(mainAppWidget: const MyApp(), runApp: runApp);
}
