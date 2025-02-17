import 'package:bloc/bloc.dart';
import 'package:bundacare/data/api_service.dart';
import 'package:bundacare/data/models/nutrition_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'nutritionbydate_state.dart';

class NutritionbydateCubit extends Cubit<NutritionbydateState> {
  final ApiService apiService;
  NutritionbydateCubit(this.apiService) : super(NutritionbydateInitial());

  @override
  void onChange(Change<NutritionbydateState> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }

  void getNutritionByDate(String date) async {
    emit(NutritionbydateLoading());
    try {
      final nutritionModel = await apiService.getNutritionByDate(date);
      emit(NutritionbydateLoaded(nutritionModel));
    } catch (e) {
      emit(NutritionbydateError(e.toString()));
    }
  }
}
