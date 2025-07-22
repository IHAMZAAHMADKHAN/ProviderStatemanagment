import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_project/pages/homepage.dart';

import 'package:provider_state_project/provider/count_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider State App',
        home: Homepage(),
      ),
    );
  }
}
