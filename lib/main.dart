import 'package:flutter/material.dart';
import 'package:real_estate_app/config/theme/theme.dart';

import 'config/routes/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Autox Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme,
      routerConfig: AppRouter.router,
    );
  }
}
