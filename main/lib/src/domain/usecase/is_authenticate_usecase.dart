import 'package:Scanner/src/domain/use_case.dart';
import 'package:Scanner/src/index.dart';

@Singleton()
class IsAuthenticateUseCase implements UseCase<void, bool> {
  final UserStorageRepository _userRepository;

  IsAuthenticateUseCase(this._userRepository);

  @override
  bool execute(void param) {
    return _userRepository.getUserToken().isNotEmpty;
  }

}
