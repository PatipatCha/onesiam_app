part of 'saved_product_bloc.dart';

abstract class SavedProductState extends Equatable {
  const SavedProductState();
  
  @override
  List<Object> get props => [];
}

class SavedProductInitial extends SavedProductState {}
