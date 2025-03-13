import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String data;

  SecondPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deuxième écran'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Texte reçu : $data',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Retour avec : $data");
              },
              child: Text('Retour'),
            ),
          ],
        ),
      ),
    );
  }
}
