import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../storage/key_value_storage_service.dart' show KeyValueStorageService;

final keyValueStorageServiceProvider = Provider<KeyValueStorageService>(
  (ref) => KeyValueStorageService(),
);
