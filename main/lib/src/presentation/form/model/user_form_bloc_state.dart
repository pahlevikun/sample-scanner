import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_form_bloc_state.freezed.dart';

@freezed
abstract class UserFormBlocState with _$UserFormBlocState {
  const factory UserFormBlocState.pure() = Pure;
}
