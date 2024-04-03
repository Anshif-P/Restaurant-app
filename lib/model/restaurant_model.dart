class Restaurant {
  int id;
  String name;
  String neighborhood;
  String photograph;
  String address;
  LatLng latLng;
  String cuisineType;
  Map<String, String> operatingHours;
  List<Review> reviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.neighborhood,
    required this.photograph,
    required this.address,
    required this.latLng,
    required this.cuisineType,
    required this.operatingHours,
    required this.reviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      neighborhood: json['neighborhood'],
      photograph: json['photograph'],
      address: json['address'],
      latLng: LatLng.fromJson(json['latlng']),
      cuisineType: json['cuisine_type'],
      operatingHours: (json['operating_hours'] as Map<String, dynamic>)
          .map((key, value) => MapEntry<String, String>(key, value as String)),
      reviews: (json['reviews'] as List<dynamic>)
          .map((review) => Review.fromJson(review))
          .toList(),
    );
  }
}

class LatLng {
  double lat;
  double lng;

  LatLng({required this.lat, required this.lng});

  factory LatLng.fromJson(Map<String, dynamic> json) {
    return LatLng(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class Review {
  String name;
  String date;
  int rating;
  String comments;

  Review({
    required this.name,
    required this.date,
    required this.rating,
    required this.comments,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      name: json['name'],
      date: json['date'],
      rating: json['rating'],
      comments: json['comments'],
    );
  }
}
