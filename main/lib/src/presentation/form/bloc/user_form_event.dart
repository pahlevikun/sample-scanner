part of 'user_form_bloc.dart';

abstract class UserFormEvent extends Equatable {
  const UserFormEvent();
}

class UserFormInit extends UserFormEvent {
  @override
  List<Object?> get props => [];
}

class UpdateUserId extends UserFormEvent {
  final String userId;

  UpdateUserId(this.userId);

  @override
  List<Object?> get props => [userId];
}

class VerifyUserId extends UserFormEvent {
  @override
  List<Object?> get props => [];
}
