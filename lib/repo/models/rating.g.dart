part of 'rating.dart';

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      description: json['description'] as String,
      rating: json['rating'] as String,
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'description': instance.description,
      'rating': instance.rating,
    };
