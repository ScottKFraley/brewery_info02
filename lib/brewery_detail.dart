import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:brewery_info02/models/brewery_model.dart';
import 'package:url_launcher/url_launcher.dart';

class BreweryDetail extends StatelessWidget {
  final BreweryModel brewery;
  // final Color lightYellow = const Color.fromRGBO(191, 204, 10, 1);
  const BreweryDetail({super.key, required this.brewery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text('${brewery.name}'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(
          children: [
            Center(
                child: Stack(
              children: [
                // black background
                Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).canvasColor),
                    padding: const EdgeInsets.all(2.0),
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: double.infinity),
                // Rounded image of the two Mugs 'O Beer
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: 200.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/img/TwoMugsOBeer.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.all(4.0),
              child: OutlinedButton(
                  onPressed: () {
                    // Package: maps_launcher
                    double lat = double.parse(brewery.latitude ?? "0.0");
                    double lon = double.parse(brewery.longitude ?? "0.0");

                    // Was planning on using the actual street address if the
                    // lat/long were null/invalid, but Roberto cut those fields
                    // out of the Model, so I can't at this time. -SKF
                    // String addressLine = '';  // (brewery.street ?? '') != ''
                    // String? addr1 = (brewery.street ?? '');
                    // String? addr2 = (brewery.address2 ?? '');
                    // String? addr3 = (brewery.address3 ?? '');

                    if (lat != 0.0 && lon != 0.0) {
                      MapsLauncher.launchCoordinates(lat, lon);
                      return;
                    } else {
                      debugPrint(
                          "MapsLauncher.launchCoordinates(lat ($lat), lon ($lon)); call SKIPPED!!");
                    }
                  },
                  style: Theme.of(context).outlinedButtonTheme.style,
                  child: const Text('Show on Map')),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('City: ${brewery.city}',
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 10.0),
                  Text('State: ${brewery.state}',
                      style: Theme.of(context).textTheme.labelSmall),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () async {
                final call = Uri.parse('tel:${brewery.phone}');
                if (await canLaunchUrl(call)) {
                  launchUrl(call);
                } else {
                  throw 'Could not launch $call';
                }
              },
              child: Text('Call!  ${brewery.phone}'),
            )
          ],
        ));
  }
}
