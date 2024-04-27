/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class BreweryModel {
  String? id;
  String? name;
  String? brewerytype;
  String? street;
  String? address2;
  String? address3;
  String? city;
  String? state;
  String? countyprovince;
  String? postalcode;
  String? country;
  String? longitude;
  String? latitude;
  String? phone;
  String? websiteurl;
  DateTime? updatedat;
  DateTime? createdat;

  // this is the constructor.
  BreweryModel(
      {this.id,
      this.name,
      this.brewerytype,
      this.street,
      this.address2,
      this.address3,
      this.city,
      this.state,
      this.countyprovince,
      this.postalcode,
      this.country,
      this.longitude,
      this.latitude,
      this.phone,
      this.websiteurl,
      this.updatedat,
      this.createdat});

  BreweryModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    brewerytype = parsedJson['brewery_type'];
    street = parsedJson['street'];
    address2 = parsedJson['address_2'];
    address3 = parsedJson['address_3'];
    city = parsedJson['city'];
    state = parsedJson['state'];
    countyprovince = parsedJson['county_province'];
    postalcode = parsedJson['postal_code'];
    country = parsedJson['country'];
    longitude = parsedJson['longitude'];
    latitude = parsedJson['latitude'];
    phone = parsedJson['phone'];
    websiteurl = parsedJson['website_url'];

    updatedat = DateTime.tryParse(parsedJson['updated_at'] ?? '');
    createdat = DateTime.tryParse(parsedJson['created_at'] ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['brewery_type'] = brewerytype;
    data['street'] = street;
    data['address_2'] = address2;
    data['address_3'] = address3;
    data['city'] = city;
    data['state'] = state;
    data['county_province'] = countyprovince;
    data['postal_code'] = postalcode;
    data['country'] = country;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['phone'] = phone;
    data['website_url'] = websiteurl;

    // DateTime.tryParse(document['time'])
    data['updated_at'] = updatedat;
    data['created_at'] = createdat;

    return data;
  }
}
