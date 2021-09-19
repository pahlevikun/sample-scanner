import 'package:Scanner/src/domain/use_case.dart';
import 'package:Scanner/src/index.dart';

@Singleton()
class DeleteUserTokenUseCase implements UseCase<void, void> {
  final UserStorageRepository _userRepository;

  DeleteUserTokenUseCase(this._userRepository);

  @override
  void execute(void param) {
    _userRepository.deleteUserToken();
  }
}
