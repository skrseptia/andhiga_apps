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
    var cart = Provider.of<Cart>(context, listen: false);
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
                      subtitle: Text(itemOnCart.qty.toString()),
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
