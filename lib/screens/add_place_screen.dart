import 'package:flutter/material.dart';
import 'package:places/models/place.dart';

import 'dart:io';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import '../helpers/location_helper.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/AddPlaceScreen";

  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _pickedLocation;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  Future<void> _selectPlace(double lat, double lng) async {
    _pickedLocation = PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: await LocationHelper.getPlaceAddress(lat: lat, lng: lng));
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!, _pickedLocation!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a New Place"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ImageInput(onSelectImage: _selectImage),
                    const SizedBox(
                      height: 10,
                    ),
                    LocationInput(onSelectPlace: _selectPlace),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 0.0,
                maximumSize: const Size(double.infinity, 100),
                minimumSize: const Size(double.infinity, 80),
                padding: const EdgeInsets.only(bottom: 10)),
            onPressed: _savePlace,
            icon: const Icon(Icons.add),
            label: const Text("Add Place"),
          ),
        ],
      ),
    );
  }
}
