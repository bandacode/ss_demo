import 'package:flutter/material.dart';
import 'package:ss_test/home/widgets/widgets.dart';
import 'package:ss_test/repo/repo.dart';

/// {@template restaurant_page}
/// A description for RestaurantPage
/// {@endtemplate}
class RestaurantPage extends StatelessWidget {
  /// {@macro restaurant_page}
  const RestaurantPage({Key? key}) : super(key: key);

  /// The static route for RestaurantPage
  static Route<dynamic> route(Restaurant restaurant) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const RestaurantPage(),
      settings: RouteSettings(arguments: restaurant),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RestaurantView(),
    );
  }
}

/// {@template restaurant_view}
/// Displays the Body of RestaurantView
/// {@endtemplate}
class RestaurantView extends StatelessWidget {
  /// {@macro restaurant_view}
  const RestaurantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RestaurantBody();
  }
}
