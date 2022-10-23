part of 'restaurant_bloc.dart';

abstract class RestaurantEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RestaurantFetched extends RestaurantEvent {}

class RestaurantRefreshed extends RestaurantEvent {}
