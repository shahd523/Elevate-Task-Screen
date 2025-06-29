
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/DI/DI.dart';
import '../manager/products_cubit.dart';
import '../widgets/custom_product_widget.dart';


class ProductsScreen extends StatefulWidget {
  ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create:  (context) => getIt.get<ProductsCubit>()..GetProducts(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProductsCubit, ProductsState>(
            buildWhen: (previous, current) {
              if(current is ProductsSuccessState || current is ProductsErrorState || current is ProductsLoadingState){
                return true;
              }
              return false;
            },
            builder: (context, state) {
              if(state is ProductsSuccessState){
                var products = state.products;
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: products.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 7 / 9,
                          ),
                          itemBuilder: (context, index) {
                            return CustomProductWidget(
                              product: products[index],
                              height: height,
                              width: width,
                            );
                          },
                          scrollDirection: Axis.vertical,
                        ),
                      )
                    ],
                  ),
                );
              }
              if(state is ProductsErrorState){
                return Center(child: Text(state.error),);
              }
              return Center(child: CircularProgressIndicator(),);
            },
          ),
        ),
      ),
    );
  }
}
