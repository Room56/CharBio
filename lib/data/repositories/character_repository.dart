
import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/models/character.dart';

class CharacterRepository {
  final Dio _dio;

  CharacterRepository(this._dio);

  Future<List<Character>> getCharacters() async {
    final response = await _dio.get('https://rickandmortyapi.com/api/character');
    final List<dynamic> data = response.data['results'];
    return data.map((json) => Character.fromJson(json)).toList();
  }
}
