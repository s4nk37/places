import 'package:flutter/material.dart';
import 'package:places/models/place.dart';
import 'dart:io';

import 'package:places/screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  final File file;
  final String title;
  final PlaceLocation location;

  const PlaceDetailScreen(
      {Key? key,
      required this.file,
      required this.title,
      required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: file,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                  ),
                ),
                child: Image.file(
                  file,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color:
                  Theme.of(context).colorScheme.inversePrimary.withOpacity(0.9),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Text(
                location.address!,
                style: const TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => MapScreen(
                            isSelecting: false,
                            initialLocation: location,
                          )));
                },
                child: const Text("View on Map")),
          ],
        ),
      ),
    );
  }
}
