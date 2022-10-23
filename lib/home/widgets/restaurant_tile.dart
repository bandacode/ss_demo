import 'package:flutter/material.dart';
import 'package:ss_test/home/home.dart';
import 'package:ss_test/repo/repo.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile(this.restaurant, {Key? key}) : super(key: key);
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: ListTile(
        onTap: () =>
            Navigator.of(context).push(RestaurantPage.route(restaurant)),
        leading: CircleAvatar(
          child: Text(restaurant.name[0]),
        ),
        title: Text(restaurant.name),
        subtitle: Row(
          children: [
            const Icon(
              Icons.location_on,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(restaurant.address),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(restaurant.ratings.length.toString()),
            const Icon(
              Icons.star,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
