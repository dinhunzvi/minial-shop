import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_button.dart';
import 'package:minimal_shop/models/product.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    // show dialog box to ask user if they want to remove product from cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Remove this product from your cart"),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);

                context.read<Shop>().removeFromCart(product);
              },
              child: const Text("Yes"),)
          ],
        ));
  }

  // user pressed the pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text("User wants to pay! Connect this app to payment backend"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Cart Page'),
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
              child: cart.isEmpty ?
              const Center(
                child:  Text("Your cart is empty")
              )
              :
              ListView.builder(
                itemCount: cart.length,
                  itemBuilder: (context, index) {
                  // get individual item in cart
                    final item = cart[index];

                    // return a list tile
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: const Icon(Icons.remove)),
                    );
                  }
              )),
          //pay button
          Padding(
              padding: const EdgeInsets.all(50.0),
          child: MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text("Pay now")),)
        ],
      ),
    );
  }
}
