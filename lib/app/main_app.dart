import 'package:flutter/material.dart';
import 'package:vocabulary/app/router/router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRouterProvider.router);
  }
}
