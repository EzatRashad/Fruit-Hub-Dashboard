import 'package:frut_hub_dashboard/core/services/fire_storage.dart';
import 'package:frut_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<StorageService>(() => FireStorage());
  // getIt.registerSingleton<StorageService>(FireStorage());
}
