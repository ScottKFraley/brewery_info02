import 'dart:convert';
import 'dart:async';

import 'package:latlong2/latlong.dart';

import 'package:location/location.dart';
import 'package:brewery_info02/models/brewery_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// This Repository class is the central point from where the data will flow
// to the BLOC.
class Repository {
  final breweryApiService = BreweryDataService();

  List<BreweryModel> cachedBreweries = <BreweryModel>[];
  DateTime cacheTimeoutAt = DateTime.now();

  Future<List<BreweryModel>> getAllBreweries() async {
    // debugPrint('cacheTimeoutAt: $cacheTimeoutAt');
    var dtNow = DateTime.now();
    // debugPrint('DateTime.now(): $dtNow');

    var cacheExpired = dtNow.isAfter(cacheTimeoutAt);
    // debugPrint('cacheExpired: $cacheExpired');

    var cachedBreweriesAny = cachedBreweries.isNotEmpty;
    // debugPrint('cachedBreweriesAny: $cachedBreweriesAny');

    if (cachedBreweriesAny && !cacheExpired) {
      return cachedBreweries;
    }

    cachedBreweries = await breweryApiService.getBreweries();
    cacheTimeoutAt = DateTime.now().add(const Duration(minutes: 2));

    return cachedBreweries;
  }
}

//
// This is the one that get's Breweries NEAR the user/device.
//
class BreweryDataService {
  String baseUrl = "https://api.openbrewerydb.org";
  var locationService = Location();
  late LocationData _locationData;

  //
  // Makes the actual API call to the OpenBreweryDB API
  //
  Future<List<BreweryModel>> getBreweries() async {
    var apiUrl = '/breweries';

    debugPrint(
        'INSIDE "Future<List<BreweryModel>> getBreweries() async {}" and about to make the API call.');

    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (response.statusCode == 200) {
        // we're good; process the received data
        List<dynamic> list = json.decode(response.body);
        debugPrint(list.toString());

        return list.map((e) => BreweryModel.fromJson(e)).toList();
      } else {
        return <BreweryModel>[];
      }
    } on Exception catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString()); // may not actually need this. Will have to see.

      // just return an empty list.
      return <BreweryModel>[];
    }
  }

  //
  // Get's the closest Brewery based on the Device's current location.
  //
  // THIS SHOULD DO ALL THE WORK, AND RETURN A DIALOG WIDGET READY TO DISPLAY.
  //
  Future<BreweryModel> getClosestBrewery() async {
    // breweryApiService.
    // Example: GET https://api.openbrewerydb.org/breweries?by_dist=38.8977,77.0365&per_page=3

    var locationAvailable = await isDeviceLocationAvailable();
    if (!locationAvailable) {
      return BreweryModel();
    }

    var gotPermissions = await doWeHaveLocationPermissions();
    if (!gotPermissions) {
      return BreweryModel();
    }

    _locationData = await locationService.getLocation();
    debugPrint('LocationData: $_locationData');

    // location.CalculateDistance()
    // if (location is null) return;
    //
    // var closestBrewery = Breweries.Where(b => b.Latitude.HasValue && b.Longitude.HasValue)
    //     .OrderBy(b => location.CalculateDistance(b.Latitude.Value, b.Longitude.Value, DistanceUnits.Miles))
    //     .FirstOrDefault();
    //
    // if (closestBrewery is null) return;t

    // if (_locationData == null)

    const Distance distance = Distance();

    var breweries = await getBreweries();

    // breweries.sort((bmA, bmB) => bmA.distanceFromLocation(currentDeviceLocation) < bmB.distanceFromLocation(currentDeviceLocation) ? -1 : 1;
    // That should work if you put a method 'distanceFromLocation(....) on your object.

    // List<BreweryModel> sortedBreweries = ** NOTE: .sort() returns a void.
    breweries.sort((bmA, bmB) {
      var itemA = distance
          .as(
              LengthUnit.Mile,
              LatLng(double.parse(bmA.latitude ?? "0.0"),
                  double.parse(bmA.longitude ?? "0.0")),
              LatLng(_locationData.latitude ?? 0.0,
                  _locationData.longitude ?? 0.0))
          .toInt();

      var itemB = distance
          .as(
              LengthUnit.Mile,
              LatLng(double.parse(bmB.latitude ?? "0.0"),
                  double.parse(bmB.longitude ?? "0.0")),
              LatLng(_locationData.latitude ?? 0.0,
                  _locationData.longitude ?? 0.0))
          .toInt();

      return itemA < itemB ? -1 : 1;
    });

    var resultantLocation = breweries.first;

    return resultantLocation;
  }

  Future<bool> isDeviceLocationAvailable() async {
    var serviceEnabled = await locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationService.requestService();
    }

    return serviceEnabled;
  }

  Future<bool> doWeHaveLocationPermissions() async {
    var permissionGranted = await locationService.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationService.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }
}
