part of 'nutrition_cubit.dart';

sealed class NutritionState extends Equatable {
  const NutritionState();

  @override
  List<Object> get props => [];
}

final class NutritionInitial extends NutritionState {}

final class NutritionLoading extends NutritionState {}

final class NutritionLoaded extends NutritionState {
  final NutritionModel nutritionModel;
  final int calory, protein, fat, carbohydrate;

  const NutritionLoaded(this.nutritionModel, this.calory, this.protein, this.fat, this.carbohydrate);

  @override
  List<Object> get props => [nutritionModel];
}

final class NutritionError extends NutritionState {
  final String message;

  const NutritionError(this.message);

  @override
  List<Object> get props => [message];
}
