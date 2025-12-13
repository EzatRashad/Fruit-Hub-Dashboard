import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frut_hub_dashboard/feature/add_product/domain/entities/product_entity.dart';
import 'package:frut_hub_dashboard/feature/add_product/presentation/view_model/add_product_state.dart';

import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/repos/product_repo/product_repo.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imageRepo, required this.productRepo})
      : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(ProductEntity addProductInputEntity) async {
    emit(AddProductLoading());

    final imageUploadResult =
        await imageRepo.uploadImage(addProductInputEntity.image);
    imageUploadResult.fold(
      (failure) {
        emit(AddProductFailure(failure.message));
      },
      (imageUrl) async {
        addProductInputEntity.imageUrl = imageUrl;
        final newProduct = addProductInputEntity;
        final addProductResult = await productRepo.addProduct(newProduct);
        addProductResult.fold(
          (failure) {
            emit(AddProductFailure(failure.message));
          },
          (_) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
