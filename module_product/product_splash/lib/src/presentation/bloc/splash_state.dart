part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({this.action = const SplashBlocState.pure()});

  final SplashBlocState action;

  SplashState copyWith({SplashBlocState? state}) {
    return SplashState(action: state ?? this.action);
  }

  @override
  List<Object?> get props => [action];
}
