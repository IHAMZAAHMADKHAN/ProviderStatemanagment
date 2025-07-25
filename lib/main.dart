import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_project/pages/darkthem.dart';
import 'package:provider_state_project/pages/homepage.dart';
import 'package:provider_state_project/pages/logInscreen.dart';

import 'package:provider_state_project/provider/count_provider.dart';
import 'package:provider_state_project/provider/loginscreenprovider.dart';
import 'package:provider_state_project/provider/themprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => Themprovider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: Consumer<Themprovider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Provider State App',
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.deepPurple,
            ),
            themeMode: themeProvider.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
