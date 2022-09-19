import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/fourth_screen.dart';
import './screens/third_screen.dart';
import './screens/first_screen.dart';
import './screens/second_screen.dart';
import './screens/home_screen.dart';
import './providers/math_provider.dart';
import './providers/counter_provider.dart';
import './providers/text_list_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => ShoppingCart()),
        ChangeNotifierProvider(create: (_) => Math()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/first': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
        '/third': (context) => const ThirdScreen(),
        '/fourth': (context) => const TimerScreen(),
      },
    );
  }
}
