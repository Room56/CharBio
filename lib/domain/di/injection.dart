import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_application_1/data/repositories/character_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => CharacterRepository(locator<Dio>()));
}
