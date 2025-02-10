import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:fruit_hub_dash/core/errors/Failures.dart';
import 'package:fruit_hub_dash/core/service/storage_service.dart';
import 'package:fruit_hub_dash/core/utils/backend_endpoint.dart';

import 'images_repo.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;

  ImageRepoImpl(this.storageService);

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      final url =
          await storageService.uploadFile(image, BackendEndpoint.images);
      return right(url);
    } catch (e) {
      return left(ServerFailure("Uploading image failed"));
    }
  }
}
