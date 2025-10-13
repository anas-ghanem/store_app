import 'package:flutter/material.dart';
import 'package:store_app/models/prodect_model.dart';

class custom_card extends StatelessWidget {
  custom_card({super.key, required this.prodect});
  ProdectModel prodect;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                offset: Offset(10, 10),
              ),
            ],
          ),
          height: 120,
          width: 210,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'updatepage',arguments: prodect);
            },
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(prodect.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${prodect.price.toString()}'),
                        Icon(Icons.heart_broken),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 23,
          top: -60,
          child: Image.network(prodect.image, height: 100, width: 100),
        ),
      ],
    );
  }
}
