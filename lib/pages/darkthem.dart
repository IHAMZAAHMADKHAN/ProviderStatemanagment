import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_project/provider/themprovider.dart';

class Darkthem extends StatefulWidget {
  const Darkthem({super.key});

  @override
  State<Darkthem> createState() => _DarkthemState();
}

class _DarkthemState extends State<Darkthem> {
  @override
  Widget build(BuildContext context) {
    print("Darkthem build"); // This should only print once ideally

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Switcher"),
        actions: [
          Consumer<Themprovider>(
            builder: (context, themeProvider, _) => Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Consumer<Themprovider>(
            builder: (context, themeProvider, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    themeProvider.isDarkMode
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    size: 100,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    themeProvider.isDarkMode
                        ? "Dark Theme is ON"
                        : "Light Theme is ON",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
