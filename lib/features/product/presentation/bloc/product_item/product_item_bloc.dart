import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onesiam_app/features/product/domain/domain.dart';
import '/injection.dart' as di;

part 'product_item_event.dart';
part 'product_item_state.dart';

class ProductItemBloc extends Bloc<ProductItemEvent, ProductItemState> {

 late List<ProductItemEntity> _productList = [];
  List<ProductItemEntity> get productList => _productList;


  ProductItemEntity? _product;
  ProductItemEntity? get product => _product;

  
  ProductItemBloc() : super(ProductItemInitial()) { 
    final GetProductItem _getProductItem = di.locator<GetProductItem>();
    
    on<onSavedProductEvent>((event, emit) async {
      // List<ProductItemEntity> product_List = productList;
      ProductItemEntity product = event.product;
      _product = product;
    });

    on<ProductItemEvent>((event, emit) async {
      emit(ProductItemLoading());
      if(productList.length == 0){
        final productItem = await _getProductItem.execute();
      if (productItem.isLeft()) {
        emit(const ProductItemError("Something is wrong"));
      } else {

      print(product);
      List<ProductItemEntity> productItemResult = productItem.getOrElse(() => throw UnimplementedError(),);
      _productList = productItemResult;
      // ProductItemEntity? productSaved = product;
        emit(ProductItemHasData(productItemResult));
      }
      }else {
        if(product != null){
        int i =0;
        productList.forEach((item){ 
          if(item.id == product!.id){   
            productList[i].saved = product!.saved!;
          }
          i++;
        }); 
        print(productList);
        emit(ProductItemHasData(productList));
      }
      }
      
    });

    

  }
}
