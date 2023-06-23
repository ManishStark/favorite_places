import 'package:favorite_places/screens/place_details.dart';
import 'package:flutter/material.dart';

import '../models/places.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({required this.places, super.key});

  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
          child: Text(
        "No Places added yet. ",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.background,
            ),
      ));
    }
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => ListTile(
              leading:
                  CircleAvatar(backgroundImage: FileImage(places[index].image)),
              title: Text(
                places[index].title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) =>
                        PlaceDetailsScreen(place: places[index])));
              },
            ));
  }
}
