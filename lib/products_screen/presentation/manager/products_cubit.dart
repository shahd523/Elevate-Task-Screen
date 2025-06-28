import 'package:bloc/bloc.dart';
import '../../data/model/ProductModel.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/GetProductsUseCase.dart';

part 'products_state.dart';
@injectable
class ProductsCubit extends Cubit<ProductsState> {
  @factoryMethod
  ProductsCubit(this.getProductsUseCase) : super(ProductsInitial());
  static ProductsCubit get(context)=>BlocProvider.of(context);
  GetProductsUseCase getProductsUseCase;
  GetProducts()async{
    emit(ProductsLoadingState());
    var result = await getProductsUseCase.call();
    result.fold((response){
      emit(ProductsSuccessState(response));
    }, (error){
      emit(ProductsErrorState(error));
    });
  }

}
