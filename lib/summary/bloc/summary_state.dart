part of 'summary_bloc.dart';

abstract class SummaryState extends Equatable {
  const SummaryState();

  @override
  List<Object> get props => [];
}

class SummaryInitial extends SummaryState {}

class ExistingDataState extends SummaryState {
  final Map<String, dynamic> gradresList;
  ExistingDataState({required this.gradresList});
  @override
  List<Object> get props => [gradresList];
}

class NoDataState extends SummaryState {}

class LoadingState extends SummaryState {}
