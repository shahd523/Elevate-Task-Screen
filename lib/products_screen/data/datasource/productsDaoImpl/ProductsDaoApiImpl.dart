import 'package:dartz/dartz.dart';
import '../../../../Core/remote/APIManager.dart';
import '../../../../Core/remote/EndPoints.dart';
import '../../model/ProductModel.dart';
import '../ProductsDao.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductsDao)
class ProductsDaoApiImpl extends ProductsDao {
  APIManager apiManager;

  @factoryMethod
  ProductsDaoApiImpl(this.apiManager);

  @override
  Future<Either<List<ProductModel>, String>> GetProducts() async {
    try {
      var response = await apiManager.getRequest(path:
          EndPoints.productsEndpoint);
      List<ProductModel> products = [];
      for(var product in response.data){
        products.add(ProductModel.fromJson(product));
      }
      return Left(products);
    } catch (error) {
      return Right(error.toString());
    }
  }


  /* Future<Either<AddWishlistModel, String>> AddToWishList(String id) async{
    try{
      var response = await apiManager.PostRequestRawData(Endpoint.wishlistEndpoint,body: {
        "productId":id
      },headers: {
        "token":PrefsHandler.getToken()
      });
      return Left(AddWishlistModel.fromJson(response.data));
    }catch(error){
      return Right(error.toString());
    }
  }*/ /*Future<Either<AddCartModel, String>> AddToCart(String id) async{
    try{
      var response = await apiManager.PostRequestRawData(Endpoint.cartEndpoint,body: {
        "productId":id
      },headers: {
        "token":PrefsHandler.getToken()
      });
      return Left(AddCartModel.fromJson(response.data));
    }catch(error){
      return Right(error.toString());
    }
  }*/
  }
