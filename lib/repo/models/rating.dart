import 'package:equatable/equatable.dart';

part 'rating.g.dart';

/// {@template review}
/// Rating object with [description] and [rating]
/// {@endtemplate}
class Rating extends Equatable {
  /// {@macro review}
  const Rating({
    required this.description,
    required this.rating,
  });

  /// Creates a Rating from Json map
  factory Rating.fromJson(Map<String, dynamic> data) => _$RatingFromJson(data);

  /// The description of a rating
  final String description;

  /// A rating
  final String rating;

  /// Creates a copy of the current Rating with property changes
  Rating copyWith({
    String? description,
    String? rating,
  }) {
    return Rating(
      description: description ?? this.description,
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object?> get props => [
        description,
        rating,
      ];

  /// Creates a Json map from a Rating
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
