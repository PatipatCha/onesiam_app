part of 'product_item_bloc.dart';

abstract class ProductItemState extends Equatable {
  const ProductItemState();
  
  @override
  List<Object> get props => [];
}

class ProductItemInitial extends ProductItemState {}

class ProductItemLoading extends ProductItemState {}

class ProductItemError extends ProductItemState {
  final String message;

  const ProductItemError(this.message);

  @override
  List<Object> get props => [message];
}

class ProductItemHasData extends ProductItemState {
  final List<ProductItemEntity> ProductItemHasDataResult;
  const ProductItemHasData(this.ProductItemHasDataResult);
  @override
  List<Object> get props => [ProductItemHasDataResult];
}

// class SavedProductState extends ProductItemState {
//   final List<ProductItemEntity> ProductItemHasDataResult;
//   const ProductItemHasData(this.ProductItemHasDataResult);
//   @override
//   List<Object> get props => [ProductItemHasDataResult];
// }

