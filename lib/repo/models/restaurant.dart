import 'package:equatable/equatable.dart';
import 'package:ss_test/repo/models/models.dart';
import 'package:ss_test/utils/utils.dart';

part 'restaurant.g.dart';

/// {@template restaurant}
/// Restaurant object containing a [name], [address], and list of [ratings]
/// {@endtemplate}
class Restaurant extends Equatable {
  /// {@macro restaurant}
  const Restaurant({
    required this.name,
    required this.address,
    required this.ratings,
  });

  /// Creates a Restaurant from Json map
  factory Restaurant.fromJson(JsonMap data) => _$RestaurantFromJson(data['attributes']);

  /// The name of a restaurant
  final String name;

  /// The address of a restaurant
  final String address;

  /// A list of ratings for a restaurant
  final List<Rating> ratings;

  /// Creates a copy of the current Restaurant with property changes
  Restaurant copyWith({
    String? name,
    String? address,
    List<Rating>? ratings,
  }) {
    return Restaurant(
      name: name ?? this.name,
      address: address ?? this.address,
      ratings: ratings ?? this.ratings,
    );
  }

  @override
  List<Object?> get props => [
        name,
        address,
        ratings,
      ];

  /// Creates a Json map from a Restaurant
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
