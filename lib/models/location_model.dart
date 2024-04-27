
class LocationModel {
  double? latitude;
  double? longitude;
  double? accuracy;
  double? altitude;
  double? speed;
  double? speedAccuracy;
  double? heading;
  double? time;

  LocationModel(
      {this.latitude,
      this.longitude,
      this.accuracy,
      this.altitude,
      this.speed,
      this.speedAccuracy,
      this.heading,
      this.time});

  LocationModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    accuracy = json['accuracy'];
    altitude = json['altitude'];
    speed = json['speed'];
    speedAccuracy = json['speedAccuracy'];
    heading = json['heading'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['accuracy'] = accuracy;
    data['altitude'] = altitude;
    data['speed'] = speed;
    data['speedAccuracy'] = speedAccuracy;
    data['heading'] = heading;
    data['time'] = time;
    
    return data;
  }
}
