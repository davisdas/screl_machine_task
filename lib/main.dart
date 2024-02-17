import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screl_machine_task/model_view/weathercontoller/weathercontroller.dart';
import 'package:screl_machine_task/view/homescreen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherController(),
        )
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
