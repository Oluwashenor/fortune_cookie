import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentFortune = "";

  final _fortuneList = [
    "You will find a new friend",
    "You will become rich",
    "You go find new babe",
    "Your best friend will be rich",
    "True love is just around the corner",
    "You, My friend, Will walk",
    "Money dey come, No fear"
  ];

  void _randomFortune() {
    var random = Random();
    int fortune = random.nextInt(_fortuneList.length);
    setState(() {
      _currentFortune = _fortuneList[fortune];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // title: const Text("Flutter Demo Home Page"),
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/fortune_cookie.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _currentFortune,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: _randomFortune, child: const Text("Get Fortune"))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _randomFortune,
      //   tooltip: 'generate fortune',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
