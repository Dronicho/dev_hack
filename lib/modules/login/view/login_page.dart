import 'package:dev_hack2/domain/repositories/repositories.dart';
import 'package:dev_hack2/modules/login/cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          LoginCubit(context.read<AuthenticationRepository>())..loadFirstTime(),
      child: LoginForm(),
    );
  }
}
