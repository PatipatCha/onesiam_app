import 'package:dartz/dartz.dart';
import 'package:onesiam_app/core/core.dart';
import 'package:onesiam_app/core/utils/failure.dart';
import 'package:onesiam_app/features/product/data/data.dart';
import 'package:onesiam_app/features/product/domain/entities/entities.dart';
import 'package:onesiam_app/features/product/domain/repositories/product_repository.dart';

class GetProductItem {
  final ProductRepository repository;
  GetProductItem({ required this.repository});

  Future<Either<Failure, List<ProductItemEntity>>> execute() {
    return repository.getProductItem();
    // try {
    //   var productItemList = await repository.getProductItem();
    //   var productList;
    //   if(productItemList != null){
    //     productList = productItemList;
    //   }
    //   var mapData = ProductModel.toEntity

    //   return Right(mapData.toList());

    // }  on ServerException {
    //   return const Left(ServerFailure('Cannot call ProductItem'));
    // } 
  }


  // Future<Either<Failure, List<ProductItemEntity>>?> getProductItem() async {
  //   try {
  //     var productItemList = await repository.getProductItem();
  //     var productList;
  //     if(productItemList != null){
  //       productList = productItemList.productItems;
  //     }
  //     return productList;

  //   }  on ServerException {
  //     return const Left(ServerFailure('Cannot call ProductOffering'));
  //   } 
  // }
}