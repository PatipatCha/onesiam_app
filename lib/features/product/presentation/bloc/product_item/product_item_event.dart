// ignore_for_file: camel_case_types

part of 'product_item_bloc.dart';

abstract class ProductItemEvent extends Equatable {
  const ProductItemEvent();

  @override
  List<Object> get props => [];
}

class onGetProductItemEvent extends ProductItemEvent {
  const onGetProductItemEvent();
  
  @override
  List<Object> get props => [];
}

class onSavedProductEvent extends ProductItemEvent {
  final ProductItemEntity product;
  const onSavedProductEvent(this.product);
  
  @override
  List<Object> get props => [];
}