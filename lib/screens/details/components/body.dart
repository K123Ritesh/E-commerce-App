import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sling_ecommerce/components/default_button.dart';
import 'package:sling_ecommerce/components/product_card.dart';
import 'package:sling_ecommerce/models/Cart.dart';
import 'package:sling_ecommerce/models/Product.dart';
import 'package:sling_ecommerce/screens/home/components/section_title.dart';
import 'package:sling_ecommerce/size_config.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  void showToast(String toastText) {
    Fluttertoast.showToast(
      msg: toastText,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 18,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(10),
                          top: getProportionateScreenWidth(10),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            demoCarts.add(Cart(product: product, numOfItem: 1));
                            showToast("${product.title} added to your cart");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Row(
                children: [
                  Text(
                    "Related Products",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    RelatedProducts.length,
                    (index) {
                      if (RelatedProducts[index].isPopular)
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ProductCard(product: RelatedProducts[index]),
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
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
