import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'strona_glowna.dart';

void main() async {
  var settings = ConnectionSettings(
      host: '195.78.67.45',
      port: 3306,
      user: 'wvhqtokdgq_flutteryourbussiness',
      password: 'azmGgD.1-*sw-OQ9',
      db: 'wvhqtokdgq_flutteryourbussiness');
  final conn = await MySqlConnection.connect(settings);

  await conn.query(
      'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)');
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Your Bussiness",
      home: Strony(),
    );
  }
}

class Strony extends StatefulWidget {
  const Strony({Key? key}) : super(key: key);

  @override
  State<Strony> createState() => _StronyState();
}

class _StronyState extends State<Strony> {
  static int _selectedIndex = 0;
  String test = "test";
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    const StronaGlowna(),
    const Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(1, 0),
            colors: <Color>[
              Color(0xFFF9F9F9),
              Color(0xFFEDEDED),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        // height: double.infinity,
        width: double.infinity,

        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          gradient: LinearGradient(
            begin: Alignment(1, 8),
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xFF2E3047),
              Color.fromARGB(255, 101, 105, 141),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('assets/checklist.png')),
              label: 'Lista zadań',
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('assets/profiles.png')),
              label: 'Klienci',
            ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage('assets/setting.png')),
              label: 'Ustawienia',
            ),
          ],
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
