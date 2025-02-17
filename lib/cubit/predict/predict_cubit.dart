import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bundacare/data/api_service.dart';
import 'package:bundacare/data/models/predict_model.dart';
import 'package:equatable/equatable.dart';

part 'predict_state.dart';

class PredictCubit extends Cubit<PredictState> {
  final ApiService apiService;
  PredictCubit(this.apiService) : super(PredictInitial());

  void predict(File? imageFile) async {
    emit(PredictLoading());
    try {
      final predictModel = await apiService.getPredict(imageFile);
      emit(PredictSuccess(predictModel));
    } catch (e) {
      emit(PredictFailed(e.toString()));
    }
  }
}
