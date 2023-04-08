import '../config.dart';
// add your api key in config.dart

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return "https://maps.geoapify.com/v1/staticmap?style=dark-matter-yellow-roads&width=850&height=400&center=lonlat:$longitude,$latitude&zoom=12.5473&marker=lonlat:$longitude,$latitude;color:%23c000ff;size:small&apiKey=$API_KEY";
  }
}
