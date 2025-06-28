import 'package:dartz/dartz.dart';
import '../model/ProductModel.dart';


abstract class ProductsDao{
  Future<Either<List<ProductModel>,String>> GetProducts();
  //Future<Either<AddWishlistModel,String>> AddToWishList(String id);
  //Future<Either<AddCartModel,String>> AddToCart(String id);
}