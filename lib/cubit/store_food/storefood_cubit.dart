import 'package:bloc/bloc.dart';
import 'package:bundacare/data/api_service.dart';
import 'package:bundacare/data/models/predict_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'storefood_state.dart';

class StorefoodCubit extends Cubit<StorefoodState> {
  final ApiService apiService;
  StorefoodCubit(this.apiService) : super(StorefoodInitial());

  @override
  void onChange(Change<StorefoodState> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }

  void storeFood(String name, PredictModel predict) {
    emit(StorefoodLoading());
    apiService.storeFood(name, predict).then((value) {
      emit(const StorefoodLoaded(isStorefood: true));
    }).catchError((onError) {
      emit(StorefoodError(message: 'Error: $onError'));
    });
  }
}
