import 'package:flutter/material.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  // add to cart function
  void addToCart(BuildContext context) {
    // show dialog box to ask user if they want to add to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Add product to your cart"),
          actions: [
            MaterialButton(
                onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),),
            MaterialButton(
                onPressed: () {
                  context.read<Shop>().addToCart(product);
                  Navigator.pop(context);
                },
            child: const Text("Yes"),)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              AspectRatio(aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
                ),),

              const SizedBox(height: 25,),
              // product name
              Text(
                product.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),

              const SizedBox(height: 25,),
              // product description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                ),),
            ],
          ),

          const SizedBox(height: 25,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // product price + button to add to cart 
              Text('\$${product.price.toStringAsFixed(2)}'),
              // add to cart button 
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: const Icon(Icons.add)),
              )
            ],
          )
        ],
      ),
    );
  }
}
