import 'package:flutter/material.dart';
import 'package:tp_navigation_data/secondpage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage> {
  final TextEditingController _controller = TextEditingController();
  String _returnedData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premier écran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Entrez un texte',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final text = _controller.text;
                if (text.isNotEmpty) {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(data: text),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      _returnedData = result;
                    });
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Le champ est vide !')),
                  );
                }
              },
              child: Text('Envoyer'),
            ),
            SizedBox(height: 16),
            Text(
              _returnedData,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
