class Brewery {
  final String id;
  final String name;
  final String breweryType;
  final String address1;
  final String? address2;
  final String? address3;
  final String city;
  final String stateProvince;
  final String postalCode;
  final String country;
  final String longitude;
  final String latitude;
  final String phone;
  final String websiteUrl;
  final String state;
  final String street;

  Brewery({
    required this.id,
    required this.name,
    required this.breweryType,
    required this.address1,
    this.address2,
    this.address3,
    required this.city,
    required this.stateProvince,
    required this.postalCode,
    required this.country,
    required this.longitude,
    required this.latitude,
    required this.phone,
    required this.websiteUrl,
    required this.state,
    required this.street,
  });

  factory Brewery.fromJson(Map<String, dynamic> json) {
    return Brewery(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      breweryType: json['brewery_type']?.toString() ?? '',
      address1: json['address_1']?.toString() ?? '',
      address2: json['address_2']?.toString(),
      address3: json['address_3']?.toString(),
      city: json['city']?.toString() ?? '',
      stateProvince: json['state_province']?.toString() ?? '',
      postalCode: json['postal_code']?.toString() ?? '',
      country: json['country']?.toString() ?? '',
      longitude: json['longitude']?.toString() ?? '',
      latitude: json['latitude']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      websiteUrl: json['website_url']?.toString() ?? '',
      state: json['state']?.toString() ?? '',
      street: json['street']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brewery_type': breweryType,
      'address_1': address1,
      'address_2': address2,
      'address_3': address3,
      'city': city,
      'state_province': stateProvince,
      'postal_code': postalCode,
      'country': country,
      'longitude': longitude,
      'latitude': latitude,
      'phone': phone,
      'website_url': websiteUrl,
      'state': state,
      'street': street,
    };
  }
}
