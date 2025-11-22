import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frut_hub_dashboard/core/utils/utils.dart';
import 'package:frut_hub_dashboard/feature/add_product/presentation/view_model/add_product_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../view_model/add_product_state.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyConsumer extends StatelessWidget {
  const AddProductViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          "Product added successfully!"
              .showSnackbar(context: context, isSuccess: true);
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //   LayoutView.routeName,
          //   (Route<dynamic> route) => false,
          // );
        } else if (state is AddProductFailure) {
          state.errorMessage.showSnackbar(context: context, isSuccess: false);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoading ? true : false,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
