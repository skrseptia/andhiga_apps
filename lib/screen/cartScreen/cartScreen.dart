// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ikhsanproject/providers/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';

  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);

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
                    return ListTile(
                      leading: SizedBox(
                        height: 150,
                        width: 80,
                        child: Image.network(
                          'https://www.resepistimewa.com/wp-content/uploads/cara-membuat-ayam-bakar-kecap.jpg',
                          height: 150,
                          width: 100,
                        ),
                      ),
                      title: Text(cart.carts.toList()[i].name),
                      subtitle: Text(cart.carts.toList()[i].qty),
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
