import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> fetchBird(){
  return http.get('https://tranquil-atoll-40168.herokuapp.com/bird/blue_jay');
}

class Bird {
  final String id, name, habitat, nest, plumage,  diet, lifespan, conservationStatus;
  final List funFacts;
  final int sageid;
  

  Bird({this.id, this.name, this.habitat, this.nest, this.plumage, this.diet, this.lifespan, this.conservationStatus, this.funFacts, this.sageid});

  factory Bird.fromJson(Map<String, dynamic> json) {
    return Bird(
      id: json['id'],
      name: json['name'],
      habitat: json['habitat'],
      nest: json['nest'],
      plumage: json['plumage'], 
      diet:json['diet'],
      lifespan: json['lifespan'],
      conservationStatus: json['conservationStatus'],
      funFacts: json['funFacts'],
      sageid: json['sageid']
    );
  }
}

Future<Bird> fetchBirdData() async {
  final response = await http.get('https://tranquil-atoll-40168.herokuapp.com/bird/blue_jay');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Bird.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Birds');
  }
}
