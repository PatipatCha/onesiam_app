import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesiam_app/features/product/data/data.dart';
import 'package:onesiam_app/features/product/domain/domain.dart';
import 'package:onesiam_app/features/product/presentation/widgets/widgets.dart';
import 'package:onesiam_app/features/product/product.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  
  @override
  void initState(){
    setSavedProductItemList();
    super.initState();
  }

  setSavedProductItemList(){
    // productItemList.forEach((element) {
    //   //set default
    //   element.saved = false;
    // });
    // print(productItemList[0].saved);
  }

  @override
  Widget build(BuildContext context) {
    final productItemBloc = context.read<ProductItemBloc>();
    productItemBloc.add(const onGetProductItemEvent());
    List<ProductItemEntity> productItemList = []; 
    return Scaffold(
      appBar: AppBar(
        title: const Text('For You'),
        
      ),
      body: BlocBuilder<ProductItemBloc, ProductItemState>(
        builder: (context, state) {
          if (state is ProductItemLoading){
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductItemError) {
            return const Center(
              child: Text("Something went wrong"),
            ); 
          } else if(state is ProductItemHasData){
            productItemList = state.ProductItemHasDataResult;
            return  Column(
                      children: [
                        SizedBox(height: 16.0),
                        ListViewProduct(products: productItemList)
                      ],
                    );
          }else {
            return const SizedBox();
          }
        }
      )
    );
  }
}


