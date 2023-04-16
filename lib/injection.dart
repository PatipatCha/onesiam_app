import 'package:get_it/get_it.dart';
import 'package:onesiam_app/features/product/data/data.dart';
import 'package:onesiam_app/features/product/domain/domain.dart';
import 'package:onesiam_app/features/product/product.dart';

final locator = GetIt.instance;

void init() async {
  //bloc
  //  locator.registerFactory(() => ProductItemBloc());
  locator.registerLazySingleton(() => ProductItemBloc());

  //usecase
  locator.registerLazySingleton(() => GetProductItem(repository: locator()));
  
  //repository
  locator.registerLazySingleton<ProductRepository>(
  () => ProductRepositoryImpl(remoteDataSource: locator()));
  
  //datasource
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());


}

void exit() {

}