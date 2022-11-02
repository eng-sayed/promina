import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/presentation/componants/customtext.dart';

import '../../../../core/utils/validation.dart';
import '../../../componants/default_button.dart';
import '../../../componants/glass_moriphism.dart';
import '../../../componants/login_text_failed.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    final cubit = AuthCubit.get(context);
    cubit.getToken(context);
    super.initState();
  }

  String? email, password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);

    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/login.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                if (!cubit.isLogin)
                  Positioned(
                      top: 70,
                      left: 60,
                      child: Image.asset('assets/images/cam.png')),
                if (!cubit.isLogin)
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          // height: 100,
                          child: CustomText(
                            'My Gallery',
                            textStyleEnum: TextStyleEnum.title,
                            maxLines: 2,
                            fontsize: 50,
                          ),
                        ),
                        Center(
                          child: GlassMorphism(
                            child: Container(
                              //padding: EdgeInsets.all(10),
                              width: 388,
                              height: 345,
                              child: Column(
                                children: [
                                  Spacer(),
                                  CustomText('LOG IN',
                                      textStyleEnum: TextStyleEnum.title),
                                  Spacer(),
                                  DefaultTextField(
                                    hintText: 'User Name',
                                    keyboardType: TextInputType.emailAddress,
                                    validate: Validation().emailValidation,
                                    onChange: (s) {
                                      email = s;
                                    },
                                  ),
                                  Spacer(),
                                  DefaultTextField(
                                    hintText: 'Password',
                                    keyboardType: TextInputType.emailAddress,
                                    validate: Validation().passwordValidation,
                                    onChange: (s) {
                                      password = s;
                                    },
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: defaultButton(
                                      text: 'SUBMIT',
                                      function: () {
                                        if (_formKey.currentState!.validate()) {
                                          cubit.login(context,
                                              username: email!,
                                              password: password!);
                                        }
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            start: .7,
                            end: 0.07,
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          );
        });
  }
}
