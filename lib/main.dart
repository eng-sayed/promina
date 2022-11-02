import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/core/utils/utils.dart';
import 'package:promina/presentation/componants/customtext.dart';
import 'package:promina/presentation/layout/gallery/screens/gallery.dart';
import 'package:promina/presentation/layout/login/screens/login.dart';
import 'package:promina/presentation/layout/splash/cubit/cubit.dart';
import 'package:promina/presentation/layout/splash/splash.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/utils/validation.dart';
import 'data/sources/api/dio.dart';
import 'data/sources/local/sharedpreferences.dart';
import 'presentation/componants/default_button.dart';
import 'presentation/componants/glass_moriphism.dart';
import 'presentation/componants/login_text_failed.dart';
import 'presentation/componants/textfield.dart';
import 'presentation/layout/gallery/cubit/gallery_cubit.dart';
import 'presentation/layout/login/cubit/auth_cubit.dart';
import 'presentation/layout/login/cubit/auth_state.dart';

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
        BlocProvider<SplashCubit>(
          create: (context) => SplashCubit(),
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
        // initialRoute:  MyHomePage(title: 'Flutter Demo Home Page'),

        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,

        home: Login(),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({
//     super.key,
//   });

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// String? email, password;
// final _formKey = GlobalKey<FormState>();

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final cubit = AuthCubit.get(context);

//     return BlocConsumer<AuthCubit, AuthStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//             body: Stack(
//               children: [
//                 Image.asset(
//                   'assets/images/login.png',
//                   width: double.infinity,
//                   height: double.infinity,
//                   fit: BoxFit.fill,
//                 ),
//                 Positioned(
//                     top: 70,
//                     left: 60,
//                     child: Image.asset('assets/images/cam.png')),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: 180,
//                         child: CustomText(
//                           'My Gallery',
//                           textStyleEnum: TextStyleEnum.title,
//                           maxLines: 2,
//                           fontsize: 50,
//                         ),
//                       ),
//                       Center(
//                         child: GlassMorphism(
//                           child: Container(
//                             padding: EdgeInsets.all(10),
//                             width: 388,
//                             height: 345,
//                             child: Column(
//                               children: [
//                                 Spacer(),
//                                 CustomText('LOG IN',
//                                     textStyleEnum: TextStyleEnum.title),
//                                 Spacer(),
//                                 DefaultTextField(
//                                   hintText: 'User Name',
//                                   keyboardType: TextInputType.emailAddress,
//                                   validate: Validation().emailValidation,
//                                   onChange: (s) {
//                                     email = s;
//                                   },
//                                 ),
//                                 Spacer(),
//                                 DefaultTextField(
//                                   hintText: 'Password',
//                                   keyboardType: TextInputType.emailAddress,
//                                   validate: Validation().passwordValidation,
//                                   onChange: (s) {
//                                     password = s;
//                                   },
//                                 ),
//                                 Spacer(),
//                                 defaultButton(
//                                   text: 'SUBMIT',
//                                   function: () {
//                                     if (_formKey.currentState!.validate()) {
//                                       cubit.login(context,
//                                           username: email!,
//                                           password: password!);
//                                     }
//                                   },
//                                 ),
//                                 Spacer(),
//                               ],
//                             ),
//                           ),
//                           start: .7,
//                           end: 0.07,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//                 // ]),
//                 // ),
//               ],
//             ),
//           );
//         });
//   }
// }
