part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInit extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class Logout extends HomeEvent {
  @override
  List<Object?> get props => [];
}
