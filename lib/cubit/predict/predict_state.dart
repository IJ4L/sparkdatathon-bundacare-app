part of 'predict_cubit.dart';

sealed class PredictState extends Equatable {
  const PredictState();

  @override
  List<Object> get props => [];
}

final class PredictInitial extends PredictState {}

final class PredictLoading extends PredictState {}

final class PredictSuccess extends PredictState {
  final PredictModel predictModel;

  const PredictSuccess(this.predictModel);

  @override
  List<Object> get props => [predictModel];
}

final class PredictFailed extends PredictState {
  final String message;

  const PredictFailed(this.message);

  @override
  List<Object> get props => [message];
}