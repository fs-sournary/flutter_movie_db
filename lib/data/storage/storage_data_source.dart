import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageDataSource {
  static const _userToken = 'user_token';

  final FlutterSecureStorage _storage;

  StorageDataSource(this._storage);

  Future<void> saveUserToken(String token) async {
    await _storage.write(key: _userToken, value: token);
  }

  Future<String> getUserToken() async {
    final token = await _storage.read(key: _userToken);
    return token ?? '';
  }
}
