import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dash/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dash/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_hub_dash/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hub_dash/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruit_hub_dash/core/service/data_service.dart';
import 'package:fruit_hub_dash/core/service/firestore_service.dart';
import 'package:fruit_hub_dash/core/service/storage_service.dart';
import 'package:fruit_hub_dash/core/service/supbase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StorageService>(SupabaseStoargeService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt
      .registerSingleton<ImageRepo>(ImageRepoImpl(getIt.get<StorageService>()));
  getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImpl(getIt.get<DatabaseService>()));

  ;
}
