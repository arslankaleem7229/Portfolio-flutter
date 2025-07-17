import 'package:arslan/src/controllers/app_controller.dart';
import 'package:arslan/src/pages/home_page/index.dart';
import 'package:arslan/src/repositories/app_respository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  _AppState() {
    _appRepository = AppRepository();
    _appController = AppController(appRepository: _appRepository);
  }

  // // Repositories
  late final AppRepository _appRepository;
  // // Controllers
  late final AppController _appController;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _appRepository),
        ChangeNotifierProvider.value(value: _appController),
      ],
      child: MaterialApp(
        key: navigatorKey,
        restorationScopeId: 'app',
        title: 'Arslan',
        themeMode: ThemeMode.dark,

        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return HomePage();
        },
      ),
    );
  }
}
