import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_project/provider/count_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("Learn Provider"), centerTitle: false),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            print("only this one is printing ");
            return Text(
              value.counter.toString(),
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CountProvider>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
