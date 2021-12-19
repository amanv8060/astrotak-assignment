import 'package:app/services/network_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

/// Sets up all the Service calls , so that a singleton service for it can be created
void setupLocator() {
  locator.registerLazySingleton(() => NetworkService());
}
