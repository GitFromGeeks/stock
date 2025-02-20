import 'package:flutter/material.dart' show Widget;
import 'package:stocks/core/storage/key_value_storage_base.dart'
    show KeyValueStorageBase;
import 'package:stocks/core/storage/path_provider_service.dart'
    show PathProviderService;

class AppBootstrapper {
  const AppBootstrapper._();

  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
    await KeyValueStorageBase.init();
    await PathProviderService.init();
    runApp(mainAppWidget);
  }
}
