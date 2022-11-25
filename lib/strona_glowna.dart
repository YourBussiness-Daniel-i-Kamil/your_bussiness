import 'package:flutter/material.dart';
import 'model.dart';
import 'litesql.dart';

class StronaGlowna extends StatefulWidget {
  const StronaGlowna({Key? key}) : super(key: key);

  @override
  State<StronaGlowna> createState() => _StronaGlownaState();
}

class _StronaGlownaState extends State<StronaGlowna> {
  late DataBase handler;
  Future<int> addPlanets() async {
    Planets firstPlanet =
        Planets(name: "Mercury", age: 24, id: 1, distancefromsun: 10);
    Planets secondPlanet =
        Planets(name: "Venus", age: 31, id: 2, distancefromsun: 20);
    Planets thirdPlanet =
        Planets(id: 3, name: 'Earth', age: 4, distancefromsun: 30);
    Planets fourthPlanet =
        Planets(id: 4, name: 'Mars', age: 5, distancefromsun: 40);

    List<Planets> planets = [
      firstPlanet,
      secondPlanet,
      thirdPlanet,
      fourthPlanet
    ];
    return await handler.insertPlanets(planets);
  }

  @override
  void initState() {
    super.initState();
    handler = DataBase();
    handler.initializedDB().whenComplete(() async {
      await addPlanets();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_constructors
      children: Container("data"),
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
      body: Row(),
    );
  }
}
