import 'package:Scanner/src/index.dart';

abstract class UserStorageRepository {
  void saveUserToken(String token);

  String getUserToken();

  void deleteUserToken();
}

class UserStorageRepositoryDelegate implements UserStorageRepository {
  final _storageService = Injector.instance<StorageManager>();

  static const String KEY_TOKEN = "${BuildConfig.APP_ID}.pref.user.token";

  @override
  void deleteUserToken() {
    _storageService.removeFromDisk(KEY_TOKEN);
  }

  @override
  String getUserToken() {
    return _storageService.getFromDisk(KEY_TOKEN) ?? '';
  }

  @override
  void saveUserToken(String token) {
    _storageService.saveToDisk(KEY_TOKEN, token);
  }
}
