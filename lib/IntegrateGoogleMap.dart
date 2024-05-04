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
  static Future<void> launchMaps(double latitude, double longitude,double currentlatitude,double currentlongitude ) async {
    print(currentlatitude);
    print(currentlongitude);
    String googleUrl = 'https://www.google.com/maps/dir/?api=1&origin=$currentlatitude,$currentlongitude&destination=$latitude,$longitude';
    // String googleUrl = 'comgooglemaps://?center=${currentlatitude},${currentlongitude}&destination=$latitude,$longitude&travelmode=driving';
    String appleUrl =
        'https://maps.apple.com/?sll=${latitude},${longitude}';
    if (await launch(googleUrl)) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  // static Future<void> launchMapsNew(double latitude, double longitude,double currentlatitude,double currentlongitude ) async {
  //   var latDes = this.items[id].LongitudeWD;
  //   var longDes = this.items[id].LatitudeWD;
  //   var url = "https://www.google.com/maps/dir/?api=1";
  //   var origin = "origin=" + tempLatitude + "," + tempLongitude;
  //   var destination = "&destination=" + latDes + "," + longDes;
  //   var newUrl = new URL(url + origin + destination);
  //
  //   var win = window.open(newUrl, '_blank');
  //   win.focus();
  // }



}