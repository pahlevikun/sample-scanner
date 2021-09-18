import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc_state.freezed.dart';

@freezed
abstract class HomeBlocState with _$HomeBlocState {
  const factory HomeBlocState.pure() = Pure;
}
