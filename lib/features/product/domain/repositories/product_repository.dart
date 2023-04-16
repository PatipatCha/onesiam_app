import 'package:dartz/dartz.dart';
import 'package:onesiam_app/core/core.dart';
import 'package:onesiam_app/features/product/data/models/models.dart';
import 'package:onesiam_app/features/product/domain/domain.dart';

abstract class ProductRepository { 
  Future<Either<Failure, List<ProductItemEntity>>> getProductItem();
}