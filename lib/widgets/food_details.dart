import 'package:flutter/material.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Size',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            Text(
              'Medium',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 35,
          child: VerticalDivider(
            indent: 3,
            width: 5,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Size',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            Text(
              '250kg',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 35,
          child: VerticalDivider(
            indent: 3,
            width: 5,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cooking',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            Text(
              '10-15 mins',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
