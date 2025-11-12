
import 'package:dartz/dartz.dart';

import '../../../feature/add_product/domain/entities/add_product_input_entity.dart';
import '../../utils/failure.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failure, void>> addProduct(AddProductInputEntity addProductInputEntity) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
  
}
