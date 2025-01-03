// lib/models/comic.dart

class Comic {
  final int id;
  final String title;
  final String imageUrl;
  final String description;

  Comic({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

// Contoh data komik
List<Comic> comics = [
  Comic(
    id: 1,
    title: "Comic 1",
    imageUrl: "https://example.com/comic1.jpg",
    description: "Description for Comic 1",
  ),
  Comic(
    id: 2,
    title: "Comic 2",
    imageUrl: "https://example.com/comic2.jpg",
    description: "Description for Comic 2",
  ),
   Comic(
    id: 3,
    title: "Comic 3",
    imageUrl: "https://example.com/comic2.jpg",
    description: "Description for Comic 2",
  ),
   Comic(
    id: 4,
    title: "Comic 4",
    imageUrl: "https://example.com/comic2.jpg",
    description: "Description for Comic 2",
  ),
   Comic(
    id: 5,
    title: "Comic 5",
    imageUrl: "https://example.com/comic2.jpg",
    description: "Description for Comic 2",
  ),
   Comic(
    id: 6,
    title: "Comic 6",
    imageUrl: "https://example.com/comic2.jpg",
    description: "Description for Comic 2",
  ),
  // Tambahkan lebih banyak data komik sesuai kebutuhan
];
