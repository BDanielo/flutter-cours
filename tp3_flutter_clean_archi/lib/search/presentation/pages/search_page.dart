import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/search_result.dart';
import '../bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Search Shows")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search for a show...",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    context.read<SearchBloc>().search(searchController.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, List<SearchResult>>(
              builder: (context, results) {
                if (results.isEmpty) {
                  return Center(child: Text("No results found"));
                }
                return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final show = results[index];
                    return ListTile(
                      leading: Image.network(show.imageUrl),
                      title: Text(show.name),
                      onTap: () {
                        Navigator.pushNamed(context, '/details', arguments: show.id);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
