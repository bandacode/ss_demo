import 'package:flutter/material.dart';
import 'package:ss_test/repo/repo.dart';

class RatingTile extends StatelessWidget {
  const RatingTile(this.rating, {Key? key}) : super(key: key);
  final Rating rating;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(rating.rating),
      subtitle: Text(rating.description),
    );
  }
}
