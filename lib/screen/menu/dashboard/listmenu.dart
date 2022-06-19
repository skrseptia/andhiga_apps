import 'package:flutter/material.dart';
import 'package:ikhsanproject/screen/detailProduct/detail_product.dart';
import '../../../providers/items.dart';
import '../../../models/item.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<void> fetchData(BuildContext context) async {
    await Provider.of<Items>(context, listen: false).fetchData();
  }

  void clickItem(Item item) {
    debugPrint(item.toString());
  }

  @override
  void initState() {
    super.initState();
    fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Consumer<Items>(builder: (context, data, child) {
                final items = data.items;
                return RefreshIndicator(
                  onRefresh: () => fetchData(context),
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: SizedBox(
                            height: 150,
                            width: 80,
                            child: Image.network(
                              items[index].image!,
                              height: 150,
                              width: 100,
                            ),
                          ),
                          title: Text(items[index].name!),
                          subtitle: Text(items[index].desc!),
                          trailing: Text(items[index].price.toString()),
                          onTap: () {
                            var id = items[index].id;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailProduct(id!),
                              ),
                            );
                          },
                        );
                      },
                      itemCount: items.length),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
