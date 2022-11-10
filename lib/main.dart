import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "WP - projekt",
      home: Strony(),
    );
  }
}

class StronaGlowna extends StatefulWidget {
  const StronaGlowna({Key? key}) : super(key: key);

  @override
  State<StronaGlowna> createState() => _StronaGlownaState();
}

class _StronaGlownaState extends State<StronaGlowna> {
  @override
  Widget build(BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Image(image: AssetImage('assets/user.png')),
    //     Image(image: AssetImage('assets/user.png')),
    //   ],
    // );

    return ListView(
      children: [
        for (var i = 0; i < 20; i++)
          Container(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
              bottom: 40.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(image: AssetImage('assets/user.png')),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Powiadomienia()),
                    );
                  },
                  child: const Image(image: AssetImage('assets/bell.png')),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class Powiadomienia extends StatefulWidget {
  const Powiadomienia({Key? key}) : super(key: key);

  @override
  State<Powiadomienia> createState() => _PowiadomieniaState();
}

class _PowiadomieniaState extends State<Powiadomienia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Text("data"),
    ));
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
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xFF2E3047),
              Color(0xFF3C3F58),
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
