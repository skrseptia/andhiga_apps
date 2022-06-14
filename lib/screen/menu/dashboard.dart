import 'package:flutter/material.dart';
import '../../providers/items.dart';
import '../../models/item.dart';
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
                            leading: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {},
                              child: Container(
                                height: 150,
                                width: 80,
                                child: Image.network(
                                  items[index].image ?? '',
                                  height: 150,
                                  width: 100,
                                ),
                              ),
                            ),
                            title: Text(items[index].tittle ?? ''),
                            subtitle: Text(items[index].desc ?? ''),
                            trailing: Text(items[index].price ?? ''),
                            
                            onTap: () => clickItem(items[index]));
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
