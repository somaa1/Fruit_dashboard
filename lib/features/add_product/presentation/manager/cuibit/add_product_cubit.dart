import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dash/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dash/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hub_dash/features/add_product/domin/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productsRepo)
      : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(ProductEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await this.imageRepo.uploadImage(addProductInputEntity.image);
    result.fold((f) {
      emit(AddProductFailure(f.message));
    }, (url) async {
      addProductInputEntity.imageUrl = url;
      var product = await productsRepo.addProduct(addProductInputEntity);
      product.fold((f) {
        emit(AddProductFailure(f.message));
      }, (r) {
        emit(AddProductSuccess());
      });
    });
  }
}
