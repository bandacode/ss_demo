import 'package:flutter/material.dart';
import 'package:ss_test/home/home.dart';
import 'package:ss_test/repo/repo.dart';

/// {@template restaurant_body}
/// Body of the RestaurantPage.
///
/// Add what it does
/// {@endtemplate}
class RestaurantBody extends StatelessWidget {
  /// {@macro restaurant_body}
  const RestaurantBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurant = ModalRoute.of(context)!.settings.arguments as Restaurant;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(restaurant.name),
            subtitle: const Text('Name'),
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(restaurant.address),
            subtitle: const Text('Address'),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Text('Ratings', style: Theme.of(context).textTheme.headline6),
          ),
          if (restaurant.ratings.isNotEmpty)
            Expanded(
              child: ListView.separated(
                itemCount: restaurant.ratings.length,
                itemBuilder: (context, index) {
                  final rating = restaurant.ratings[index];
                  return RatingTile(rating);
                },
                separatorBuilder: (context, index) {
                  return const Divider(height: 0);
                },
              ),
            )
          else
            const Center(
              child: Text('No Ratings currently available'),
            ),
        ],
      ),
    );
  }
}
