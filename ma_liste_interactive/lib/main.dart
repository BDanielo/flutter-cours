import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ma Liste Interactive',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListePage(),
    );
  }
}
class ListePage extends StatefulWidget {
  @override
  _ListePageState createState() => _ListePageState();
}

class _ListePageState extends State<ListePage> {
  final List<String> _items = ['Les cours en tt', 'Item 2', 'Item 3', 'Item 4'];
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _items.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ma Liste Interactive'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Ajouter un élément',
                      labelStyle: TextStyle(color: Colors.orange),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                    onSubmitted: (value) => _addItem(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.orange),
                  onPressed: _addItem,
                ),
              ],
            ),
          ),
          Expanded(
            child: _items.isEmpty
                ? Center(
              child: Text(
                'La liste est vide',
                style: TextStyle(color: Colors.orange, fontSize: 18),
              ),
            )
                : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _items[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.remove, color: Colors.orange),
                    onPressed: () => _removeItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}