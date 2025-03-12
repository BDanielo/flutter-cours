class SearchResultModel {
  final int id;
  final String name;
  final String imageUrl;

  SearchResultModel({required this.id, required this.name, required this.imageUrl});

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_thumbnail_path'],
    );
  }
}
