import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash/core/errors/Failures.dart';

abstract class ImageRepo {
  Future<Either<Failure, String>> uploadImage(File image);
}
