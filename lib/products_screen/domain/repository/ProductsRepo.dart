

import 'package:dartz/dartz.dart';

import '../../data/model/ProductModel.dart';

abstract class ProductsRepo{
  Future<Either<List<ProductModel>,String>> GetProducts();
 // Future<Either<AddWishlistEntity,String>> AddToWishList(String id);
  //Future<Either<AddCartEntity,String>> AddToCart(String id);
}