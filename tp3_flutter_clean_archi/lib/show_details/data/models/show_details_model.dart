class ShowDetailsModel {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> genres;
  final String status;

  ShowDetailsModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.genres,
    required this.status,
  });

  factory ShowDetailsModel.fromJson(Map<String, dynamic> json) {
    return ShowDetailsModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_thumbnail_path'],
      description: json['description'] ?? '',
      genres: List<String>.from(json['genres'] ?? []),
      status: json['status'] ?? 'Unknown',
    );
  }
}