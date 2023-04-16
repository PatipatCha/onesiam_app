import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onesiam_app/features/product/domain/domain.dart';
import '/injection.dart' as di;

part 'product_item_event.dart';
part 'product_item_state.dart';

class ProductItemBloc extends Bloc<ProductItemEvent, ProductItemState> {
  
  ProductItemBloc() : super(ProductItemInitial()) { 
    final GetProductItem _getProductItem = di.locator<GetProductItem>();;
    on<ProductItemEvent>((event, emit) async {
      emit(ProductItemLoading());

      final productItem = await _getProductItem.execute();
      if (productItem.isLeft()) {
        emit(const ProductItemError("Something is wrong"));
      } else {

      print(productItem);
        List<ProductItemEntity> productItemResult = productItem.getOrElse(() => throw UnimplementedError(),);
      //   productItemResult.forEach((element) {
      //   //set default
      //   element.saved = false;
      // });
      // print(productItemList[0].saved);
        emit(ProductItemHasData(productItemResult));
      }
    });
  }
}
