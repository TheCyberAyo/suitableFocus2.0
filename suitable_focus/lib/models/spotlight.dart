class Spotlight {
  final String id;
  final String title;
  final String content;
  final String? imageUrl;
  final String? author;

  Spotlight({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    this.author,
  });

  factory Spotlight.fromJson(Map<String, dynamic> json) {
    return Spotlight(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      imageUrl: json['imageUrl'],
      author: json['author'],
    );
  }
}