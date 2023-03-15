import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _randomNumber = 0;

  void _generateRandomNumber() {
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    setState(() {
      _randomNumber = randomNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number Generator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Number Generator'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Generated number: $_randomNumber',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _generateRandomNumber,
                child: Text('Generate Random Number'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
