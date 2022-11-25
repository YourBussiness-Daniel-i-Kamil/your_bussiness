import 'package:flutter/material.dart';
import 'model.dart';
import 'litesql.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
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
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: handler.retrievePlanets(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Planets>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.album),
                          title: Text('The Enchanted Nightingale'),
                          subtitle: Text(
                              'Music by Julie Gable. Lyrics by Sidney Stein.'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('BUY TICKETS'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('LISTEN'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
