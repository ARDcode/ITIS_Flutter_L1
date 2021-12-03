import 'package:first_project/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

main() async {
  await SentryFlutter.init((options) {
    options.dsn =
        'https://cee8624374eb4185ac329a37702a34d9@o1083245.ingest.sentry.io/6092812';
    options.tracesSampleRate = 1.0;
  },
      appRunner: () =>
          runApp(ModularApp(module: AppModule(), child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    ).modular();
  }
}
