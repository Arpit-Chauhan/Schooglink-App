import 'dart:convert';

import 'package:get/get.dart';
import 'package:schooglink/models/dog_image.dart';

import '../models/breed.dart';
import '../repositories/breed_repository.dart';
import '../services/api_service.dart';

class BreedListController extends GetxController {
  final BreedRepository _breedRepository = BreedRepository();

  final RxList dogBreeds = [].obs;
  final RxBool isLoading = true.obs;
  final RxBool isError = false.obs;
  final RxString image = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final APIService dogAPIService = APIService();
    _breedRepository.initialize(dogAPIService); // Initialize _APIService in BreedRepository
    fetchDogBreeds();
  }

  Future<void> fetchDogBreeds() async {
    isLoading(true);
    try {
      final breedsResponse = await _breedRepository.getDogBreeds();
      final breeds = json.decode(breedsResponse);
      dogBreeds.value = breeds.map((item) => Breed.fromJson(item)).toList();
    } catch (e) {
      print(e);
      isError(true);
    } finally {
      isLoading(false);
    }
  }

  Future<String> fetchDogImage(String imgId) async {
    try {
      final dogImageResponse = await _breedRepository.getDogImage(imgId);
      final dogImage = json.decode(dogImageResponse);
      final dogImg = DogImage.fromJson(dogImage);
      image.value = dogImg.url ?? '';
      return image.value;
    } catch (e) {
      print(e);
      isError(true);
    } finally {}
    return '';
  }
}
