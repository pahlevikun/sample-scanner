import 'package:Scanner/src/index.dart';

import 'index.dart';

@module
abstract class DataModule {
  @factory
  UserStorageRepository provideUserStorageRepository(
          StorageManager storageManager) =>
      UserStorageRepositoryDelegate(storageManager);

  @factory
  StorageManager provideStorageManager(SharedPreferences preferences) =>
      StorageManager(preferences);

  @preResolve
  Future<SharedPreferences> provideSharedPreferences() =>
      SharedPreferences.getInstance();
}
