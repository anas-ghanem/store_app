import 'package:flutter/material.dart';
import 'package:store_app/models/prodect_model.dart';
import 'package:store_app/servaces/getall_prodect.dart';
import 'package:store_app/widgets/custom_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: FutureBuilder<List<ProdectModel>>(
          future: GetallProdect().getallprodect(),
          builder: (context, Snapshot) {
            if (Snapshot.hasData) {
              
              List productlist = Snapshot.data!;
              return GridView.builder(
                itemCount: productlist.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: ((context, index) {
                  return custom_card(prodect: productlist[index],);
                }),
              );
            } else {
                            print(Snapshot.error);

              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
