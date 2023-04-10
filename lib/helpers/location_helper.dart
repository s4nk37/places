import '../config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// add your api key in config.dart

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return "https://maps.geoapify.com/v1/staticmap?style=dark-matter-yellow-roads&width=850&height=400&center=lonlat:$longitude,$latitude&zoom=12.5473&marker=lonlat:$longitude,$latitude;color:%23c000ff;size:small&apiKey=$API_KEY";
  }

  static Future<String> getPlaceAddress(
      {required double lat, required double lng}) async {
    final url = Uri.parse(
        "https://api.geoapify.com/v1/geocode/reverse?lat=$lat&lon=$lng&type=street&lang=en&limit=1&format=json&apiKey=$API_KEY");
    final addressData = await http.get(url);
    return json.decode(addressData.body)['results'][0]['formatted'];
  }
}
