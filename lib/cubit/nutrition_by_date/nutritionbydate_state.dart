part of 'nutritionbydate_cubit.dart';

sealed class NutritionbydateState extends Equatable {
  const NutritionbydateState();

  @override
  List<Object> get props => [];
}

final class NutritionbydateInitial extends NutritionbydateState {}

final class NutritionbydateLoading extends NutritionbydateState {}

final class NutritionbydateLoaded extends NutritionbydateState {
  final NutritionModel nutritionModel;

  const NutritionbydateLoaded(this.nutritionModel);

  @override
  List<Object> get props => [nutritionModel];
}

final class NutritionbydateError extends NutritionbydateState {
  final String message;

  const NutritionbydateError(this.message);

  @override
  List<Object> get props => [message];
}