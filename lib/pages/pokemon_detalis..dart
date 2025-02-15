import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String types;
  final String abilities;
  final String generation;

  const PokemonDetailsPage({
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.abilities,
    required this.generation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Type:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              types,
              style: TextStyle(
                fontSize: 18,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Abilities:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              abilities,
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Generation:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              generation,
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
