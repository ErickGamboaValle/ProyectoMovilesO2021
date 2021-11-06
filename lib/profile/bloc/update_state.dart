part of 'update_bloc.dart';

abstract class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

class UpdateInitial extends UpdateState {}

class UpdatedState extends UpdateState {}

class LoadingUpdate extends UpdateState {}

class ErrorUpdate extends UpdateState {
  final errorMsg;

  ErrorUpdate({required this.errorMsg});

  @override
  // TODO: implement props
  List<Object> get props => errorMsg;
}
