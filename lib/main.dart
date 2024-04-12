import 'package:flu_5_food_delivery/auth/login_or_register.dart';
import 'package:flu_5_food_delivery/models/restaurant_model.dart';
import 'package:flu_5_food_delivery/pages/login_page.dart';
import 'package:flu_5_food_delivery/pages/register_page.dart';
import 'package:flu_5_food_delivery/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => Restaurant()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: const LoginOrRegister());
  }
}
