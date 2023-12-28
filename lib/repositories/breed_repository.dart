import '../services/api_service.dart';

class BreedRepository {
  late APIService _APIService; // Declared _dogAPIService as late

  BreedRepository();

  void initialize(APIService dogAPIService) {
    _APIService = dogAPIService; // Initialize _dogAPIService
  }

  Future<dynamic> getDogBreeds() async {
    if (_APIService == null) {
      throw Exception('DogAPIService not initialized');
    }
    try {
      final breeds = await _APIService.fetchDogBreeds();
      return breeds;
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch dog breeds: $e');
    }
  }

  Future<dynamic> getDogImage(String imgId) async {
    if (_APIService == null) {
      throw Exception('DogAPIService not initialized');
    }
    try {
      final dogImage = await _APIService.fetchDogImage(imgId);
      return dogImage;
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch dog breeds: $e');
    }
  }
}
