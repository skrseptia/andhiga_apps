// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ikhsanproject/providers/cart.dart';
import 'package:ikhsanproject/providers/items.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';

  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: true);
    var items = Provider.of<Items>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text("Keranjang"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemBuilder: ((context, i) {
                    var itemOnCart = cart.carts[i];
                    var item = items.findById(itemOnCart.id!);
                    int qty = itemOnCart.qty;
                    double price = item.price!;
                    double subtotal = price * qty;

                    return ListTile(
                      leading: SizedBox(
                        height: 150,
                        width: 80,
                        child: Image.network(
                          item.image!,
                          height: 150,
                          width: 100,
                        ),
                      ),
                      title: Text(item.name!),
                      subtitle: Text("$qty x $price = $subtotal"),
                      trailing: SizedBox(
                        width: 140,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 45,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (qty > 1) {
                                      cart.minusQty(itemOnCart);
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          content: const Text(
                                              'Apakah anda yakin untuk menghapus?'),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Tidak'),
                                              onPressed: () {
                                                Navigator.of(ctx).pop(false);
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Ya'),
                                              onPressed: () {
                                                Navigator.of(ctx).pop(true);
                                                cart.removeItemById(item.id!);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: Text("-")),
                            ),
                            SizedBox(
                              width: 40,
                              child: Center(child: Text('$qty')),
                            ),
                            SizedBox(
                              width: 45,
                              child: ElevatedButton(
                                  onPressed: () => cart.addQty(itemOnCart),
                                  child: Text("+")),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  itemCount: cart.carts.length,
                ),
              ),
            ],
          ),
        ));
  }
}
