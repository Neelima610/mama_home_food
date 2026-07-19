
// faq_model.dart
class FaqModel {
  const FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    this.categoryId,
    this.isExpanded = false,
  });


  final String id;

  final String question;

  final String answer;

  final String? categoryId;

  final bool isExpanded;



  factory FaqModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return FaqModel(
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
      categoryId: map['categoryId'],
      isExpanded:
          map['isExpanded'] ?? false,
    );
  }



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'categoryId': categoryId,
      'isExpanded': isExpanded,
    };
  }



  FaqModel copyWith({
    String? id,
    String? question,
    String? answer,
    String? categoryId,
    bool? isExpanded,
  }) {
    return FaqModel(
      id: id ?? this.id,
      question:
          question ?? this.question,
      answer:
          answer ?? this.answer,
      categoryId:
          categoryId ?? this.categoryId,
      isExpanded:
          isExpanded ?? this.isExpanded,
    );
  }
}