import 'dart:async';

import 'package:Scanner/src/presentation/form/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Scanner/src/index.dart';

part 'user_form_event.dart';

part 'user_form_state.dart';

@Injectable()
class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  UserFormBloc(this._saveUserTokenUseCase) : super(const UserFormState());

  final SaveUserTokenUseCase _saveUserTokenUseCase;

  String _userId = "";

  @override
  Stream<UserFormState> mapEventToState(
    UserFormEvent event,
  ) async* {
    if (event is UserFormInit) {
      yield state.copyWith(state: UserFormBlocState.pure());
    } else if (event is UpdateUserId) {
      _userId = event.userId;
    } else if (event is VerifyUserId) {
      if (_userId.isNotEmpty) {
        _saveUserTokenUseCase.execute(_userId);
        yield state.copyWith(state: UserFormBlocState.goToScan());
      } else {
        yield state.copyWith(state: UserFormBlocState.userIdEmpty());
      }
    }
  }
}
