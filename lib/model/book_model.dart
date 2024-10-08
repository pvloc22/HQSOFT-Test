import 'dart:convert';

class BookCategory {
  final String name;
  final String imagePath;

  BookCategory(this.name, this.imagePath);
}

class Book {
  final String title;
  final double price;
  final String imagePath;
  final List<String> genres; // Thêm trường genres

  Book({
    required this.title,
    required this.price,
    required this.imagePath,
    required this.genres, // Thêm genres vào constructor
  });

  static List<Book> parseBooks(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => Book.fromJson(json)).toList();
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      price: json['price'],
      imagePath: json['image_path'],
      genres: List<String>.from(json['genres'] ?? []), // Phân tích cú pháp genres
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'image_path': imagePath,
      'genres': genres, // Chuyển đổi genres thành JSON
    };
  }
}