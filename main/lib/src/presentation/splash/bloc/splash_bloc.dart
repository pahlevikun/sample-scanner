import 'dart:async';

import 'package:Scanner/src/domain/index.dart';
import 'package:Scanner/src/presentation/splash/model/model.dart';
import 'package:foundation_injector/foundation_injector.dart';
import 'package:shared_utilities/utilities.dart';

part 'splash_event.dart';

part 'splash_state.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._isAuthenticateUseCase) : super(const SplashState());

  final IsAuthenticateUseCase _isAuthenticateUseCase;

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is SplashInit) {
      yield state.copyWith(state: SplashBlocState.pure());
      add(SplashChecking());
    } else if (event is SplashChecking) {
      await Future.delayed(Duration(seconds: TIME_OUT));
      final isAuthenticate = _isAuthenticateUseCase.execute({});
      if (isAuthenticate) {
        yield state.copyWith(state: SplashBlocState.sessionValid());
      } else {
        yield state.copyWith(state: SplashBlocState.sessionInValid());
      }
    }
  }

  static const TIME_OUT = 2;
}
