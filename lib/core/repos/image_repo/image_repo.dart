import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';

abstract class ImageRepo {
  Future<Either<Failure, String>> uploadImage(File image);
}
