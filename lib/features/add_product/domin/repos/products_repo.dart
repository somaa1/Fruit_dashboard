import 'package:fruit_hub_dash/features/add_product/domin/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<void> addProduct(ProductEntity addProductInputEntity);
}
