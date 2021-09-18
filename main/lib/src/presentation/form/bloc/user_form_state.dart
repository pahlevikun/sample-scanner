part of 'user_form_bloc.dart';

class UserFormState extends Equatable {
  const UserFormState({this.action = const UserFormBlocState.pure()});

  final UserFormBlocState action;

  UserFormState copyWith({UserFormBlocState? state}) {
    return UserFormState(action: state ?? this.action);
  }

  @override
  List<Object?> get props => [action];
}
