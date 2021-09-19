import 'package:Scanner/src/index.dart';

abstract class UserStorageRepository {
  void saveUserToken(String token);

  String getUserToken();

  void deleteUserToken();
}

class UserStorageRepositoryDelegate implements UserStorageRepository {
  final StorageManager _storageManager;

  UserStorageRepositoryDelegate(this._storageManager);

  static const String KEY_TOKEN = "${BuildConfig.APP_ID}.pref.user.token";

  @override
  void deleteUserToken() {
    _storageManager.removeFromDisk(KEY_TOKEN);
  }

  @override
  String getUserToken() {
    return _storageManager.getFromDisk(KEY_TOKEN) ?? '';
  }

  @override
  void saveUserToken(String token) {
    _storageManager.saveToDisk(KEY_TOKEN, token);
  }
}
