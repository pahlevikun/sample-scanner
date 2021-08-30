part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({this.action = const HomeBlocState.pure()});

  final HomeBlocState action;

  HomeState copyWith({HomeBlocState? state}) {
    return HomeState(action: state ?? this.action);
  }

  @override
  List<Object?> get props => [action];
}
