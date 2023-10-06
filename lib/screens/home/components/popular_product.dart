import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sling_ecommerce/components/product_card.dart';
import 'package:sling_ecommerce/models/Product.dart';
import 'package:sling_ecommerce/screens/home/components/special_offers.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "Popular Products",
              press: () {
                Get.to(Smart_Phone(title: 'Popular products'));
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular)
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ProductCard(product: demoProducts[index]),
                    );

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
