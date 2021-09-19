import 'package:Scanner/src/domain/use_case.dart';
import 'package:Scanner/src/index.dart';

@Singleton()
class SaveUserTokenUseCase implements UseCase<String, void> {
  final UserStorageRepository _userRepository;

  SaveUserTokenUseCase(this._userRepository);

  @override
  void execute(String param) {
    _userRepository.saveUserToken(param);
  }
}
