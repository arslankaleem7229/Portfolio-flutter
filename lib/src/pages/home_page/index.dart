import 'package:arslan/src/controllers/app_controller.dart';
import 'package:arslan/src/pages/profile_page/index.dart';
import 'package:arslan/src/widgets/gradients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppController appController;

  @override
  void initState() {
    appController = context.read<AppController>();
    appController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF142131), Color(0xFF000113)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            TopGradient(),
            BottomGradient(),
            SafeArea(
              top: true,
              bottom: false,
              child: ProfileScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
