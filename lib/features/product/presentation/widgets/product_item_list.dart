// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:onesiam_app/models/product_model.dart';
import 'package:onesiam_app/themes/themes.dart';

class ListViewProduct extends StatefulWidget {
  final List<ProductItem> products;
  const ListViewProduct({super.key, required this.products});

  @override
  State<ListViewProduct> createState() => _ListViewProductState();
}

class _ListViewProductState extends State<ListViewProduct> {
  @override
  Widget build(BuildContext context) {
  
  setButtonSaved(ProductItem product){
    print(product.saved);
    if(product.saved != null){
      if(product.saved!){
        setState(() {
          product.saved = !product.saved!;
        });
      }else{
        setState(() {
          product.saved = !product.saved!;
        });
      }
    }
  }

  return Expanded(
    child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 280),
        itemCount: widget.products.length,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Image.network(
                        widget.products[index].imageUrl,
                        // width: 100,
                        height: 130,
                        fit: BoxFit.fill
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: InkWell(
                          child: widget.products[index].saved! ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite),
                        onTap: () {
                          setButtonSaved(widget.products[index]);
                        },),
                      ),
                    ]
                  ),
                ),
                Divider(),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(widget.products[index].name, style: TextStyle(fontSize: 18), maxLines: 2, overflow: TextOverflow.ellipsis,),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('฿${widget.products[index].price}'),
                )
                
              ],
            ),
          );
        }),
  );
  }
}




