import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coinbase_client/features/coinbase/presentation/providers/exchange_rate_provider.dart';
import 'package:coinbase_client/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());

  final sing = Sing();
  print(sing.color);
  sing.color = Colors.black;
  print(Sing().color);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => getIt<ExchangeRateProvider>(),
          dispose: (context, value) => value.close(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // work on dev
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'You have pushed the button this many times:',
        ),
      ),
    );
  }
}

abstract class Animal {
  Color get getColor => Colors.black;
}

class Bird with Animal {}

extension GetInit on double {}

class Sing {
  static final Sing _instance = Sing._internal(Colors.amber);

  Color color;

  factory Sing() {
    return _instance;
  }

  Sing._internal(this.color);
}
