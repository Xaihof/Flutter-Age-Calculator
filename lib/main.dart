import 'package:f_age_calculator/calculator_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(70))),
        child: const Padding(
            padding: EdgeInsets.only(top: 63,left: 35),
            child: Text("Age Calculator",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold))),
      ),
      Expanded(
          child: Stack(children: [
        Container(color: Theme.of(context).colorScheme.inversePrimary),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70))),
          child: Column(
            children: [
              const SizedBox(height: 70),
              Expanded(
                  child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: const SingleChildScrollView(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [CalculatorCard()],
                      ))))
            ],
          ),
        )
      ]))
    ]));
  }
}
