import 'package:flutter/material.dart';

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
      child: const Text("data"),
    ));
  }
}
