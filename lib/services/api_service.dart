import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  final String baseUrl = 'https://api.thedogapi.com/v1/breeds';
  final String apiKey = 'YOUR_API_KEY'; // Replace with API key

  Future<dynamic> fetchDogBreeds() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      // headers: {
      //   'x-api-key': apiKey,
      //   'Content-Type': 'application/json', // Adjust headers as required
      // },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch dog breeds - ${response.statusCode}');
    }
  }

  Future<dynamic> fetchDogImage(String imgId) async {
    final response = await http.get(
      Uri.parse('https://api.thedogapi.com/v1/images/$imgId'),
      // headers: {
      //   'x-api-key': apiKey,
      //   'Content-Type': 'application/json', // Adjust headers as required
      // },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch dog breeds - ${response.statusCode}');
    }
  }
}
