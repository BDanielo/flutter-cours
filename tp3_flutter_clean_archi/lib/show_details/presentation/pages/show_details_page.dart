import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/show_details.dart';
import '../bloc/show_details_bloc.dart';

class ShowDetailsPage extends StatelessWidget {
  final int showId;

  ShowDetailsPage({required this.showId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Show Details")),
      body: BlocBuilder<ShowDetailsBloc, ShowDetails?>(
        builder: (context, details) {
          if (details == null) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(details.imageUrl, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  details.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Genres: ${details.genres.join(", ")}"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Status: ${details.status}"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(details.description),
              ),
            ],
          );
        },
      ),
    );
  }
}