import 'dart:math';
import 'package:flutter/material.dart';
import 'SecondPage.dart';

void main() => runApp(MyApp());

// MyApp er en StatefulWidget, som holder styr på _MyAppState
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

// _MyAppState holder styr på tilstanden for MyApp
class _MyAppState extends State<MyApp> {
  int _randomNumber = 0;

  // Funktionen _generateRandomNumber genererer et tilfældigt tal mellem 0 og 100
  void _generateRandomNumber() {
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    setState(() {
      _randomNumber = randomNumber;
    });
  }

  // build metoden bygger widget træet for MyApp
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Titlen på appen
      title: 'Random Number Generator',
      // Den første rute er "/"
      initialRoute: '/',
      // onGenerateRoute bruges til at navigere til forskellige ruter
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/second':
            // Hvis ruten er "/second", vis SecondPage
            return MaterialPageRoute(builder: (_) => SecondPage());
          default:
            return null;
        }
      },
      // Selve appen
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Number Generator'),
        ),
        // En skuffe, der indeholder en liste af elementer
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
              // En liste med elementer i skuffen
              Builder(
                builder: (context) => ListTile(
                  title: Text('Second Page'),
                  onTap: () {
                    // Navigation til "/second"
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SecondPage()),
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Luk skuffen
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        // Kroppen af appen
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // Vis det genererede tal
                'Genereret tal: $_randomNumber',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                // Knap til at generere et nyt tal
                onPressed: _generateRandomNumber,
                child: Text('Generer tilfældigt tal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
