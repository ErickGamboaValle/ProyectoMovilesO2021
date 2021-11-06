part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ExistingDataState extends HomeState {
  final List<Map<String, dynamic>> examsList;
  ExistingDataState({required this.examsList});
  @override
  List<Object> get props => [examsList];
}

class NoDataState extends HomeState {}

class LoadingState extends HomeState {}
