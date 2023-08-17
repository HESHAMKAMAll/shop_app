import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, i) {
          final cartItem = cart[i];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem["imageUrl"].toString()),
            ),
            title: Text(
              cartItem["title"].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text("Size:  ${cartItem["sizes"]}"),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Delete Product",
                          style: Theme.of(context).textTheme.titleMedium),
                      content: const Text(
                          "Are you sure you want to remove the product from your cart?"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.blue),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeProduct(cartItem);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Yes",
                              style: TextStyle(color: Colors.red),
                            )),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete,
                  color: Theme.of(context).colorScheme.primary, size: 30),
            ),
          );
        },
      ),
    );
  }
}
