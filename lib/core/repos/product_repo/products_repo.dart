import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash/core/errors/Failures.dart';
import 'package:fruit_hub_dash/features/add_product/domin/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(
      ProductEntity addProductInputEntity);
}
