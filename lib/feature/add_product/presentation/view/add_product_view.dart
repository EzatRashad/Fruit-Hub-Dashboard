import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frut_hub_dashboard/core/services/get_it_service.dart';
import 'package:frut_hub_dashboard/feature/add_product/presentation/view_model/add_product_cubit.dart';

import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import 'widgets/add_product_view_body_consumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = "Add Product";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        imageRepo: getIt.get<ImageRepo>(),
        productRepo: getIt.get<ProductRepo>(),
      ),
      child: AddProductViewBodyConsumer(),
    );
  }
}
