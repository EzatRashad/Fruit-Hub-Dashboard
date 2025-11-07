import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import 'image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
