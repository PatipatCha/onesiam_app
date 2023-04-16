import 'package:dartz/dartz.dart';
import 'package:onesiam_app/core/core.dart';
import 'package:onesiam_app/features/product/data/data.dart';
import 'package:onesiam_app/features/product/domain/domain.dart';
import 'package:onesiam_app/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<Either<Failure, List<ProductItemEntity>>> getProductItem() async {
    var result = await remoteDataSource.getProductItem();
    try {
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Cannot call getDeliveryAddress'));
    } on DataNotFoundException{
      return const Left(ServerFailure('Data not found'));
    }
  }



}