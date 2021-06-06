import 'package:dev_hack2/domain/repositories/event_repository.dart';
import 'package:dev_hack2/modules/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
