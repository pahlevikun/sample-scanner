part of 'user_form_bloc.dart';

abstract class UserFormEvent extends Equatable {
  const UserFormEvent();
}

class UserFormInit extends UserFormEvent {
  @override
  List<Object?> get props => [];
}
