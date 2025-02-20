import 'key_value_storage_base.dart';

class KeyValueStorageService {
  static const authToken = 'authToken';

  final keyValueStorage = KeyValueStorageBase();

  Future<String?> getAuthToken() async {
    return await keyValueStorage.getEncrypted(authToken);
  }

  void setAuthToken(String token) {
    keyValueStorage.setEncrypted(authToken, token);
  }

  void resetKeys() {
    keyValueStorage.clearEncrypted();
  }
}
