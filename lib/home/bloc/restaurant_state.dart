part of 'restaurant_bloc.dart';

enum RestaurantStatus { initial, loading, success, failure }

class RestaurantState extends Equatable {
  const RestaurantState({
    this.status = RestaurantStatus.initial,
    this.message,
    this.restaurants = const <Restaurant>[],
    this.hasReachedMax = false,
    this.currentPage = 0,
  });

  final RestaurantStatus status;
  final String? message;
  final List<Restaurant> restaurants;
  final bool hasReachedMax;
  final int currentPage;

  @override
  List<Object?> get props => [
        status,
        message,
        restaurants,
        hasReachedMax,
        currentPage,
      ];

  /// Creates a copy of the current RestaurantState with property changes
  RestaurantState copyWith({
    RestaurantStatus? status,
    String? message,
    List<Restaurant>? restaurants,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return RestaurantState(
      status: status ?? this.status,
      message: message ?? this.message,
      restaurants: restaurants ?? this.restaurants,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
