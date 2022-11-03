import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/presentation/componants/customtext.dart';

import '../../../../core/utils/validation.dart';
import '../../../componants/default_button.dart';
import '../../../componants/glass_moriphism.dart';
import '../../../componants/default_text_failed.dart';
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
    cubit.getUserData(context);
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
                  'assets/images/background.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                    top: 70,
                    left: 60,
                    child: Image.asset('assets/images/cam.png')),
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
                      if (!cubit.isLogin)
                        Center(
                          child: GlassMorphism(
                            width: 388,
                            height: 345,
                            child: Container(
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
                                    keyboardType: TextInputType.visiblePassword,
                                    validate: Validation().passwordValidation,
                                    onChange: (s) {
                                      password = s;
                                    },
                                  ),
                                  Spacer(),
                                  defaultButton(
                                    text: 'SUBMIT',
                                    function: () {
                                      if (_formKey.currentState!.validate()) {
                                        cubit.login(context,
                                            username: email!,
                                            password: password!);
                                      }
                                    },
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
