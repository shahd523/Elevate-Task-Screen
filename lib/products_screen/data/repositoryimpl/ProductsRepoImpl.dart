
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../Core/InternetChecker.dart';
import '../../data/model/ProductModel.dart';
import '../../data/datasource/ProductsDao.dart';
import '../../domain/repository/ProductsRepo.dart';
@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo{
  ProductsDao apiDao;
  @factoryMethod
  ProductsRepoImpl(this.apiDao);
  @override
  Future<Either<List<ProductModel>, String>> GetProducts() async{
    bool isConnected = await InternetChecker.CheckNetwork();
    if(isConnected){
      var result = await apiDao.GetProducts();
      return result.fold((products){
        return Left(products);
      }, (error){
        return Right(error);
      });
    }else{
      return Right("No Internet Connection");
    }
  }

 /* Future<Either<AddWishlistEntity, String>> AddToWishList(String id) async{
    bool isConnected = await InternetChecker.CheckNetwork();
    if(isConnected){
      var result = await apiDao.AddToWishList(id);
      return result.fold((model){
        if(model.statusMsg!=null){
          return Right(model.message!);
        }else{
          return Left(model.toWishlistEntity());
        }
      }, (error){
        return Right(error);
      });
    }else{
      return Right("No Internet Connection");
    }
  }

  @override
  Future<Either<AddCartEntity, String>> AddToCart(String id) async{
    bool isConnected = await InternetChecker.CheckNetwork();
    if(isConnected){
      var result = await apiDao.AddToCart(id);
      return result.fold((model){
        if(model.statusMsg!=null){
          return Right(model.message!);
        }else{
          return Left(model.toCartEntity());
        }
      }, (error){
        return Right(error);
      });
    }else{
      return Right("No Internet Connection");
    }
  }*/

}