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
        elevation: 0,
        automaticallyImplyLeading: false
        
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

        //                 Expanded(
        //   child: GridView.builder(
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2, mainAxisExtent: 280),
        //       itemCount: productItemList.length,
        //       itemBuilder: (_, index) {
        //         return Container(
        //           margin: EdgeInsets.all(10),
        //           decoration:
        //               BoxDecoration(border: Border.all(color: Colors.black38)),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             // mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Stack(children: [
        //                   Image.network(productItemList[index].imageUrl ?? '',
        //                       // width: 100,
        //                       height: 130,
        //                       fit: BoxFit.fill),
        //                   Positioned(
        //                     top: 5,
        //                     right: 5,
        //                     child: InkWell(
        //                       child: productItemList[index].saved!
        //                           ? Icon(Icons.favorite, color: Colors.red)
        //                           : Icon(Icons.favorite),
        //                       onTap: () {
        //                         context.read<ProductBloc>().add(
        //                             onSavedProductEvent(widget.products[index])
        //                                 as ProductEvent);
        //                         // .read<DeliveryAddressMemberBloc>()
        //                         // .add(AddressListEventSelect(item));
        //                         setButtonSaved(widget.products[index]);
        //                       },
        //                     ),
        //                   ),
        //                 ]),
        //               ),
        //               Divider(),
        //               SizedBox(height: 5),
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //                 child: Text(
        //                   widget.products[index].name ?? '',
        //                   style: TextStyle(fontSize: 18),
        //                   maxLines: 2,
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //               ),
        //               SizedBox(height: 10),
        //               Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //                 child: Text('฿${widget.products[index].price}'),
        //               )
        //             ],
        //           ),
        //         );
        //       }),
        // )
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


