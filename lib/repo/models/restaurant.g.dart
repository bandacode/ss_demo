part of 'restaurant.dart';

Restaurant _$RestaurantFromJson(JsonMap json) => Restaurant(
      name: json['name'] as String,
      address: json['address'] as String,
      ratings: (json['ratings']['data'] as List<dynamic>)
          .map((dynamic e) => Rating.fromJson(e['attributes'] as JsonMap))
          .toList(),
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'ratings': instance.ratings,
    };
