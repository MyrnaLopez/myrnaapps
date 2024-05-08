import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinosaurio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DinosaurioPage(),
    );
  }
}

class DinosaurioPage extends StatefulWidget {
  @override
  _DinosaurioPageState createState() => _DinosaurioPageState();
}

class _DinosaurioPageState extends State<DinosaurioPage> {
  String nombre = '';
  String nombreDinosaurio = '';

  final List<String> nombresDinosaurios = [
    'Tyrannosaurus',
    'Stegosaurus',
    'Velociraptor',
    'Triceratops',
    'Brachiosaurus',
    'Ankylosaurus',
    'Diplodocus',
    'Pterodactyl',
    'Allosaurus',
    'Spinosaurus',
  ];

  void generarDinosaurio() {
    setState(() {
      if (nombre.isNotEmpty) {
        final random = Random();
        nombreDinosaurio =
            nombresDinosaurios[random.nextInt(nombresDinosaurios.length)];
      } else {
        nombreDinosaurio = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¿Qué dinosaurio eres?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingresa tu nombre:',
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    nombre = text;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nombre',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                generarDinosaurio();
              },
              child: Text('Generar'),
            ),
            SizedBox(height: 20),
            Text(
              'Tu dinosaurio:',
            ),
            SizedBox(height: 10),
            Text(
              nombreDinosaurio,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
