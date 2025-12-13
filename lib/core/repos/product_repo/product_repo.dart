import 'package:dartz/dartz.dart';
import 'package:frut_hub_dashboard/core/utils/failure.dart';
import 'package:frut_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity addProductInputEntity);
}
