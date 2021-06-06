import 'package:dev_hack2/domain/repositories/repositories.dart';
import 'package:dev_hack2/modules/profile_update/profile_cubit.dart';
import 'package:dev_hack2/modules/profile_update/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdatePage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (context) => ProfileUpdatePage());
  }

  const ProfileUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(context.read<AuthenticationRepository>()),
      child: ProfileInitialUpdate(),
    );
  }
}
