import 'package:dartz/dartz.dart';
import 'package:frut_hub_dashboard/core/services/firebase_services/database_service.dart';

import '../../../feature/add_product/data/models/product_model.dart';
import '../../../feature/add_product/domain/entities/product_entity.dart';
import '../../utils/failure.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;
  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct(
      ProductEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
          path: "products",
          data: ProductModel.fromEntity(addProductInputEntity).toJson());
      return Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to add product"));
    }
  }
}
