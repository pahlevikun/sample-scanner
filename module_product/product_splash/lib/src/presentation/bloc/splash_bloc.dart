import 'dart:async';

import 'package:foundation_injector/foundation_injector.dart';
import 'package:product_splash/src/presentation/model/model.dart';
import 'package:shared_utilities/utilities.dart';

part 'splash_event.dart';

part 'splash_state.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState());

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is SplashInit) {
      yield state.copyWith(state: SplashBlocState.pure());
      add(SplashChecking());
    } else if (event is SplashChecking) {
      await Future.delayed(Duration(seconds: TIME_OUT));
      yield state.copyWith(state: SplashBlocState.done());
    }
  }

  static const TIME_OUT = 2;
}
