import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_drawer.dart';
import 'package:minimal_shop/components/my_product_tile.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Shop Page'),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25.0,),
          // shop sub tile
          Center(
            child: Text(
                "Pick from a range of premium products",
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),

          )


          // shop title
          Text("MINIMAL SHOP"),
          // product list
          SizedBox(
            height: 550,
            child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index ) {
                  // get each individual product from shop
                  // return a product tile
                  final product = products[index];

                  return MyProductTile(product: product);
                }),
          )
        ],
      )

    );
  }
}
