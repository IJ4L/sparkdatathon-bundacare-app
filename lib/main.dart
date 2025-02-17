import 'package:bundacare/cubit/chat/chat_cubit.dart';
import 'package:bundacare/cubit/nutrition/nutrition_cubit.dart';
import 'package:bundacare/cubit/nutrition_by_date/nutritionbydate_cubit.dart';
import 'package:bundacare/cubit/other_cubit.dart';
import 'package:bundacare/cubit/predict/predict_cubit.dart';
import 'package:bundacare/cubit/sign_In/sign_in_cubit.dart';
import 'package:bundacare/cubit/store_food/storefood_cubit.dart';
import 'package:bundacare/data/api_service.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DateCubit()),
        BlocProvider(create: (context) => ChatButtonCubit()),
        BlocProvider(create: (context) => SignInCubit(apiService)),
        BlocProvider(create: (context) => NutritionCubit(apiService)),
        BlocProvider(create: (context) => NutritionbydateCubit(apiService)),
        BlocProvider(create: (context) => PredictCubit(apiService)),
        BlocProvider(create: (context) => StorefoodCubit(apiService)),
        BlocProvider(create: (context) => ChatCubit(apiService)),
      ],
      child: MaterialApp.router(
        title: AppID.appName,
        routerConfig: router,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.background,
        ),
      ),
    );
  }
}
