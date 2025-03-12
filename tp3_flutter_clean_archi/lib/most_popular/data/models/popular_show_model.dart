class PopularShowModel {
  final int id;
  final String name;
  final String imageUrl;
  PopularShowModel({required this.id, required this.name, required this.imageUrl});
  factory PopularShowModel.fromJson(Map<String, dynamic> json) {
    return PopularShowModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_thumbnail_path'],
    );
  }
}