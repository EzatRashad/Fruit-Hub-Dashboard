import 'package:frut_hub_dashboard/core/services/fire_storage.dart';
import 'package:frut_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

import '../repos/image_repo/image_repo.dart';
import '../repos/image_repo/image_repo_impl.dart';
import '../repos/product_repo/product_repo.dart';
import '../repos/product_repo/product_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<StorageService>(() => FireStorage());
  getIt.registerLazySingleton<ImageRepo>(() => ImageRepoImpl(storageService: getIt<StorageService>()));
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepoImpl());
  // getIt.registerSingleton<StorageService>(FireStorage());
}
