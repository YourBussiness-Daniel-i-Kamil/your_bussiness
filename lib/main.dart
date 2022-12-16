import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'tasks.dart';
import 'litesql.dart';
import 'strona_glowna.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final widgetOptions = [
    const StronaGlowna(),
    const Tasks(),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(1, 0),
            colors: <Color>[
              Color(0xFFa6f9f5),
              Color(0xFFbfeaed),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        // height: double.infinity,
        // width: double.infinity,

        child: widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          gradient: LinearGradient(
            begin: Alignment(1, 8),
            end: Alignment(0.1, 1),
            colors: <Color>[
              Color(0xFF161F3A),
              Color.fromARGB(255, 47, 65, 121),
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
              icon: Image(
                image: AssetImage('assets/checklist.png'),
                height: 60,
                width: 60,
              ),
              label: 'Lista zadań',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/profiles.png'),
                height: 60,
                width: 60,
              ),
              label: 'Klienci',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/locate.png'),
                height: 60,
                width: 60,
              ),
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
