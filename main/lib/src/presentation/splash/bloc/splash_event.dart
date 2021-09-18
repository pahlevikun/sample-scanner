part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashChecking extends SplashEvent {
  @override
  List<Object?> get props => [];
}

class SplashInit extends SplashEvent {
  @override
  List<Object?> get props => [];
}
