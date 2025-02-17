import 'package:bloc/bloc.dart';
import 'package:bundacare/data/api_service.dart';
import 'package:bundacare/data/models/nutrition_model.dart';
import 'package:equatable/equatable.dart';

part 'nutrition_state.dart';

class NutritionCubit extends Cubit<NutritionState> {
  final ApiService apiService;
  NutritionCubit(this.apiService) : super(NutritionInitial());

  void getNutrition() async {
    emit(NutritionLoading());
    try {
      NutritionModel nutritionModel = await apiService.getNutrition();
      var totalCalories =
          nutritionModel.nutritions.fold<int>(0, (previousValue, element) {
        return previousValue + element.kalori;
      });
      var totalProtein =
          nutritionModel.nutritions.fold<int>(0, (previousValue, element) {
        return previousValue + element.protein;
      });

      var totalCarbohydrate =
          nutritionModel.nutritions.fold<int>(0, (previousValue, element) {
        return previousValue + element.karbo;
      });

      var totalFat =
          nutritionModel.nutritions.fold<int>(0, (previousValue, element) {
        return previousValue + element.lemak;
      });
      emit(NutritionLoaded(nutritionModel, totalCalories, totalProtein,
          totalFat, totalCarbohydrate));
    } catch (e) {
      emit(NutritionError(e.toString()));
    }
  }
}
