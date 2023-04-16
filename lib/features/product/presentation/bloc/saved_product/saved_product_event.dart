part of 'saved_product_bloc.dart';

abstract class SavedProductEvent extends Equatable {
  const SavedProductEvent();

  @override
  List<Object> get props => [];
}

class onSavedProductEvent extends SavedProductEvent {
  const onSavedProductEvent(ProductItemEntity product);
  
  @override
  List<Object> get props => [];
}