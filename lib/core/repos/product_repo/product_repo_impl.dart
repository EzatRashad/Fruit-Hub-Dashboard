import 'package:dartz/dartz.dart';
import 'package:frut_hub_dashboard/core/services/firebase_services/database_service.dart';

import '../../../feature/add_product/data/models/add_product_input_model.dart';
import '../../../feature/add_product/domain/entities/add_product_input_entity.dart';
import '../../utils/failure.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;
  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
          path: "products",
          data:
              AddProductInputModel.fromEntity(addProductInputEntity).toJson());
      return Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to add product"));
    }
  }
}
