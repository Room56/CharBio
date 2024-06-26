import 'package:dio/dio.dart';
import 'package:flutter_application_1/classes/character.dart';

class CharacterService {
  final Dio _dio = Dio();

  Future<List<Character>> fetchCharacters() async {
    final response = await _dio.get('https://rickandmortyapi.com/api/character');
    
    if (response.statusCode == 200) {
      List<dynamic> results = response.data['results'];
      return results.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
