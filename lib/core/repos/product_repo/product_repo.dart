import 'package:dartz/dartz.dart';
import 'package:frut_hub_dashboard/core/utils/failure.dart';
import 'package:frut_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure,void>> addProduct(AddProductInputEntity addProductInputEntity);
}
