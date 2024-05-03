import 'package:url_launcher/url_launcher.dart';

class MapUtils {

  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
    }
  //import 'package:url_launcher/url_launcher.dart';
  // _launchMaps(double latitude, double longitude) async {
  //   String googleUrl = 'comgooglemaps://?center=${latitude.origLocationObj.lat},${longitude.origLocationObj.lon}';
  //   String appleUrl =
  //       'https://maps.apple.com/?sll=${longitude.origLocationObj.lat},${longitude.origLocationObj.lon}';
  //   if (await canLaunch("comgooglemaps://")) {
  //     print('launching com googleUrl');
  //     await launch(googleUrl);
  //   } else if (await canLaunch(appleUrl)) {
  //     print('launching apple url');
  //     await launch(appleUrl);
  //   } else {
  //     throw 'Could not launch url';
  //   }
  // }
}