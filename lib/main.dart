import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/router/auth_guard.dart';
import 'package:my_app/router/router.gr.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/providers/auth_state.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  await AuthService.instance.init();
  final appRouter = AppRouter(authGuard: AuthGuard());
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthState()),
      ],
      child: Builder(
          builder: (context) => MaterialApp.router(
                theme: ThemeData(),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  colorScheme: ColorScheme.fromSeed(
                      brightness: Brightness.dark,
                      seedColor: const Color.fromARGB(255, 110, 176, 230)),
                  fontFamily: 'Barlow',
                  canvasColor: const Color.fromARGB(255, 13, 22, 35),
                  textTheme: const TextTheme(
                      headlineMedium: TextStyle(
                          fontFamily: 'Barlow',
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                  scaffoldBackgroundColor:
                      const Color.fromARGB(255, 13, 22, 35),
                ),
                themeMode: ThemeMode.dark,
                title: 'BCC Media',
                routerDelegate: appRouter.delegate(),
                routeInformationParser: appRouter.defaultRouteParser(),
              ))));
}
