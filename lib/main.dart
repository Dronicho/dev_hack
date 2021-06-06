import 'package:dev_hack2/domain/repositories/event_repository.dart';
import 'package:dev_hack2/domain/services/location.dart';
import 'package:dev_hack2/modules/app/bloc/app_cubit.dart';
import 'package:dev_hack2/modules/home/cubit/home_cubit.dart';
import 'package:dev_hack2/modules/profile_update/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'domain/blocs/authentication/authentication.dart';
import 'domain/repositories/repositories.dart';
import 'domain/services/services.dart';
import 'modules/app/bloc/loading_cubit.dart';
import 'modules/home/view/home_page.dart';
import 'modules/login/login.dart';
import 'modules/profile_update/page.dart';

Future<void> main() async {
  Intl.defaultLocale = 'ru_RU';
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt.I.registerSingleton(await Storage().init());
  GetIt.I.registerSingleton(FirebaseStorageService());
  GetIt.I.registerSingleton(Api());
  GetIt.I.registerSingleton(await LocationService().init());
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
  ));
}

class Format extends InheritedWidget {
  Format({Key? key, required this.child}) : super(key: key, child: child);

  final Widget child;
  final _formatter = DateFormat('dd MMM yyyy');
  final _timeFormatter = DateFormat('HH:mm');

  String format(DateTime date) {
    return _formatter.format(date);
  }

  String formatTime(DateTime date) {
    return _timeFormatter.format(date);
  }

  static Format? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Format>();
  }

  @override
  bool updateShouldNotify(Format oldWidget) {
    return true;
  }
}

class App extends StatelessWidget {
  const App({Key? key, required this.authenticationRepository})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
            authenticationRepository: authenticationRepository,
            userRepository: UserRepository()),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''), // English, no country code
            const Locale('ru', ''), // Spanish, no country code
          ],
          navigatorKey: _navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            backgroundColor: Color(0xffbbdefb),
            primaryColor: Color(0xfffd9602f),
          ),
          builder: (context, child) {
            return BlocProvider(
              create: (context) => AppCubit(),
              child: BlocProvider(
                create: (context) => EventCubit(EventRepository()),
                child: Format(
                  child: BlocListener<AuthenticationBloc, AuthenticationState>(
                      listener: (context, state) {
                        print(state.status);
                        switch (state.status) {
                          case AuthenticationStatus.authenticatedFirstTime:
                            print('hiy');
                            _navigator.pushAndRemoveUntil(
                                ProfileUpdatePage.route(), (route) => false);
                            break;
                          case AuthenticationStatus.authenticated:
                            context.read<EventCubit>().load();
                            context.read<AppCubit>().updateUser(state.user);
                            _navigator.pushAndRemoveUntil<void>(
                              HomePage.route(),
                              (route) => false,
                            );
                            break;
                          case AuthenticationStatus.unauthenticated:
                            print('hiy');
                            _navigator.pushAndRemoveUntil<void>(
                              LoginPage.route(),
                              (route) => false,
                            );
                            break;
                          default:
                            _navigator.pushAndRemoveUntil<void>(
                              LoginPage.route(),
                              (route) => false,
                            );
                            break;
                        }
                      },
                      child: child!),
                ),
              ),
            );
          },
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ))),
    );
  }
}
