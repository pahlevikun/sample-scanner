import 'dart:async';

import 'package:Scanner/src/presentation/form/model/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Scanner/src/index.dart';

part 'user_form_event.dart';

part 'user_form_state.dart';

@Injectable()
class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  UserFormBloc() : super(const UserFormState());

  @override
  Stream<UserFormState> mapEventToState(
    UserFormEvent event,
  ) async* {
    if (event is UserFormInit) {
      yield state.copyWith(state: UserFormBlocState.pure());
    }
  }
}
