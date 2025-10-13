import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/prodect_model.dart';
import 'package:store_app/servaces/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfild.dart';

class UpdatePage extends StatefulWidget {
  static String id = "updatepage";

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? productname, des, image;
  bool isloading = false;

  String? price;

  @override
  Widget build(BuildContext context) {
    ProdectModel prodect =
        ModalRoute.of(context)!.settings.arguments as ProdectModel;

    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('Update Page'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                custom_textfild(
                  hinttext: "product name ",
                  onChanged: (data) {
                    productname = data;
                  },
                ),
                SizedBox(height: 15),
                custom_textfild(
                  hinttext: "des",
                  onChanged: (data) {
                    des = data;
                  },
                ),
                SizedBox(height: 15),
                custom_textfild(
                  hinttext: "price",
                  onChanged: (data) {
                    price = data;
                  },
                ),
                SizedBox(height: 15),
                custom_textfild(
                  hinttext: "image",
                  onChanged: (data) {
                    image = data;
                  },
                ),
                SizedBox(height: 19),
                custom_button(
                  text: "update",
                  onPressed: () async {
                    isloading = true;
                    setState(() {});
                    try  {
                      await update_method(prodect);
                      print("updated");
                    } on Exception catch (e) {
                      
                      print(e);
                    }isloading = false;
                      setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> update_method(ProdectModel prodect) async {
    await UpdateProduct().updateProduct(
      id: prodect.id,
      title: productname==null?prodect.title:productname!,
      image: image==null?prodect.image:image!,
      category: prodect.category,
    );
  }
}
