import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'data/sources/api/dio.dart';
import 'data/sources/local/sharedpreferences.dart';
import 'presentation/layout/gallery/cubit/gallery_cubit.dart';
import 'presentation/layout/login/cubit/auth_cubit.dart';
import 'presentation/layout/login/screens/login.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<GalleryCubit>(
          create: (context) => GalleryCubit(),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) {
          child = botToastBuilder(context, child);
          return ResponsiveWrapper.builder(child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.resize(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
              background: Container(color: Color(0xFFF5F5F5)));
        },

        title: 'Pro Mina',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        debugShowCheckedModeBanner: false,

        home: Login(),
      ),
    );
  }
}
