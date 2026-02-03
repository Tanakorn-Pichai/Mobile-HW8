import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'List Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class data {
  late int id;
  late String name;
  late DateTime t;
  data(this.id, this.name, this.t);
}

class _MyHomePageState extends State<MyHomePage> {
  String txt = "N/A";
  List<data> myList = <data>[];
  int img = 0;
  var list = ['one', 'two', 'three', 'four'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: img,
                  onChanged: (int? value) {
                    setState(() {
                      img = 1;
                    });
                  },
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/ig.png'),
                ),
                Radio(
                  value: 2,
                  groupValue: img,
                  onChanged: (int? value) {
                    setState(() {
                      img = 2;
                    });
                  },
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/line.png'),
                ),
                Radio(
                  value: 3,
                  groupValue: img,
                  onChanged: (int? value) {
                    setState(() {
                      img = 3;
                    });
                  },
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/marvel.jpg'),
                ),
                Radio(
                  value: 4,
                  groupValue: img,
                  onChanged: (int? value) {
                    setState(() {
                      img = 4;
                    });
                  },
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/avengers.png'),
                ),
              ],
            ),
            const TextField(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  txt = "Add item Success";
                  myList.add(
                    data(
                      myList.length + 1,
                      'Title Text ${myList.length + 1}',
                      DateTime.now(),
                    ),
                  );
                });
              },
              child: const Text("Add Item"),
            ),
            Text(txt, textScaleFactor: 2),
            SizedBox(
              width: double.infinity,
              height: 550,
              child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/ig.png'),
                        ),
                        title: Text('Item ${myList[index].id}'),
                        subtitle: Text(myList[index].t.toString()),
                        trailing: const Icon(Icons.delete_rounded),
                        onTap: () {
                          setState(() {
                            txt = "Title Text ($index) is removed";
                            myList.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
