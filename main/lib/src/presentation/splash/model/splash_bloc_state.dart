import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_bloc_state.freezed.dart';

@freezed
abstract class SplashBlocState with _$SplashBlocState {
  const factory SplashBlocState.pure() = Pure;

  const factory SplashBlocState.validateSession() = ValidateSession;

  const factory SplashBlocState.sessionValid() = SessionValid;

  const factory SplashBlocState.sessionInValid() = SessionInValid;
}
