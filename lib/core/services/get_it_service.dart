import 'package:frut_hub_dashboard/core/services/firebase_services/storage_service.dart';
import 'package:frut_hub_dashboard/core/services/firebase_services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';

import '../repos/image_repo/image_repo.dart';
import '../repos/image_repo/image_repo_impl.dart';
import '../repos/product_repo/product_repo.dart';
import '../repos/product_repo/product_repo_impl.dart';
import 'firebase_services/database_service.dart';
import 'firebase_services/firestore_service.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<ImageRepo>(
      ImageRepoImpl(storageService: getIt.get<StorageService>()));
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(databaseService: getIt.get<DatabaseService>()));

  // getIt.registerSingleton<StorageService>(FireStorage());
}
