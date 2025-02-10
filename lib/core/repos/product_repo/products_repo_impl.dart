import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dash/core/errors/Failures.dart';
import 'package:fruit_hub_dash/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hub_dash/core/service/data_service.dart';
import 'package:fruit_hub_dash/core/utils/backend_endpoint.dart';
import 'package:fruit_hub_dash/features/add_product/data/models/product_model.dart';
import 'package:fruit_hub_dash/features/add_product/domin/entities/product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addProduct(
      ProductEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
          path: BackendEndpoint.addProducts,
          data:
              ProductModel.fromEntitiy(addProductInputEntity).toJson());
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Could not add product'));
    }
  }
}
