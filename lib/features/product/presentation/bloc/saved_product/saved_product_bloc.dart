import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onesiam_app/features/product/domain/entities/product_entity.dart';

part 'saved_product_event.dart';
part 'saved_product_state.dart';

class SavedProductBloc extends Bloc<SavedProductEvent, SavedProductState> {
  SavedProductBloc() : super(SavedProductInitial()) {
    on<SavedProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
