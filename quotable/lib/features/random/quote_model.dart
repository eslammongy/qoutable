class Quote {
  final String? id;
  final String? author;
  final String? content;
  final List<String>? tags;
  final String? dateAdded;

  Quote({
    String? id,
    String? author,
    String? content,
    List<String>? tags,
    String? dateAdded,
  })  : id = '',
        author = '',
        content = '',
        tags = [],
        dateAdded = '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'author': author,
      'content': content,
      'tags': tags,
      'dateAdded': dateAdded,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'] as String,
      author: map['author'] as String,
      content: map['content'] as String,
      tags: List<String>.from((map['tags'] as List<String>)),
      dateAdded: map['dateAdded'] as String,
    );
  }
}
