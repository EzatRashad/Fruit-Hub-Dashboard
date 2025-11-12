import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../services/storage_service.dart';
import '../../utils/failure.dart';
import 'image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;
  ImageRepoImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage(File imageFile) async {
    try {
      final imageUrl = await storageService.uploadImage(imageFile,"images");
      return Right(imageUrl);
    } catch (e) {
      return Left(ServerFailure( "Failed to upload image"));
    }
  }
}
