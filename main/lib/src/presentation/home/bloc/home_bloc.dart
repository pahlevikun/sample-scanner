import 'dart:async';

import 'package:Scanner/src/index.dart';
import 'package:Scanner/src/presentation/home/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foundation_injector/foundation_injector.dart';

part 'home_event.dart';

part 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._deleteUserTokenUseCase) : super(const HomeState());

  final DeleteUserTokenUseCase _deleteUserTokenUseCase;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeInit) {
      yield state.copyWith(state: HomeBlocState.pure());
    } else if (event is Logout) {
      _deleteUserTokenUseCase.execute({});
      yield state.copyWith(state: HomeBlocState.goToForm());
    }
  }
}
