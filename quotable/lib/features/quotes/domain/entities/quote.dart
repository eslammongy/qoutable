import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class QuoteEntity extends Equatable {
  @Id(assignable: true)
  final int? id;
  final String? author;
  final String? content;
  final List<String>? tags;
  final String? dateBookmarked;

  const QuoteEntity({
    this.id,
    this.author,
    this.content,
    this.tags,
    this.dateBookmarked,
  });

  @override
  List<Object?> get props {
    return [
      id,
      author,
      content,
      tags,
      dateBookmarked,
    ];
  }
}
