import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../data/model/ProductModel.dart';

import '../repository/ProductsRepo.dart';

@injectable
class GetProductsUseCase{
  ProductsRepo repo;
  @factoryMethod
  GetProductsUseCase(this.repo);

  Future<Either<List<ProductModel>, String>> call()=>repo.GetProducts();
}