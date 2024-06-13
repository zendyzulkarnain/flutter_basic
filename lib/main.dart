import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic/mahasiswa.dart';

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
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hello Flutter Kelas B'),
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
  bool isLoading = true;

  List<Mahasiswa> listMahasiswa = [
    Mahasiswa(nim: 123, name: 'Siti', address: 'Hutabohu'),
    Mahasiswa(nim: 456, name: 'Elan', address: 'Paguyaman'),
    Mahasiswa(nim: 178, name: 'Ferdi', address: 'Batudaa'),
    Mahasiswa(nim: 190, name: 'Fandi', address: 'Bongomeme')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text('Data Mahasiswa'),
                      content: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Name : '),
                            Text(listMahasiswa[index].name)
                          ],
                        ),
                      ]),
                    );
                  });
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 248, 41, 5),
                child: Text('${listMahasiswa[index].nim}'),
              ),
              title: Text('${listMahasiswa[index].name}'),
              subtitle: Text('${listMahasiswa[index].address}'),
            ),
          );
        },
        itemCount: listMahasiswa.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
