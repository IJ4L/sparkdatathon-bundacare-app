import 'package:bundacare/cubit/other_cubit.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DateCubit()),
        BlocProvider(create: (context) => ChatButtonCubit()),
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
