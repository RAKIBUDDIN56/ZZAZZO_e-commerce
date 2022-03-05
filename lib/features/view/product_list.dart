import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:rakibuddin560p/config/themes/colors.dart';
import 'package:rakibuddin560p/config/themes/theme.dart';
import 'package:rakibuddin560p/features/controller/product_controller.dart';
import 'package:rakibuddin560p/features/view/product_detail.dart';
import 'package:rakibuddin560p/shared_components/widget/product_card.dart';
import 'package:rakibuddin560p/shared_components/widget/extension.dart';

import 'package:sizer/sizer.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen(this.tag);
  final String tag;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  //creating a controller object and using get.put() to insert dependencies.
  ProductController productController = Get.put(ProductController());
  bool isHomePageSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            _appBar(),
            SizedBox(
              height: 5.h,
            ),
            _search(),
            SizedBox(
              height: 5.h,
            ),
            _categoryWidget(),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              flex: 1,
              //grid built inside obx function.
              child: Obx(
                () {
                  if (widget.tag == 'men'
                      ? productController.isLoading.value
                      : productController.isLoading2.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: widget.tag == 'men'
                          ? productController.productList.length
                          : productController.productListWomen.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              print('clicked');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetailPage(
                                          widget.tag == 'men'
                                              ? productController
                                                  .productList[index]
                                              : productController
                                                  .productListWomen[index])));
                            },
                            child: ProductCard(widget.tag == 'men'
                                ? productController.productList[index]
                                : productController.productListWomen[index]));
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ConstandColor.lightGrey.withAlpha(100),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search ....",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          const SizedBox(width: 20),
          // _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xfff8f8f8),
                          blurRadius: 10,
                          spreadRadius: 10),
                    ],
                  ),
                  child: const Icon(
                    Icons.more_vert,
                  ))
              .ripple(() {},
                  borderRadius: const BorderRadius.all(Radius.circular(13))),
        ],
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: AppTheme.fullWidth(context),
      height: 8.h,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        Card(
          color: Colors.white,
          elevation: 4,
          child: Container(
              height: 15.h,
              width: 30.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(32))),
              child: Row(
                children: [
                  Image.asset(
                    'assets/shoe_thumb_1.png',
                    height: 40,
                    width: 40,
                  ),
                  const Text(
                    'Sneakers',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              )),
        ),
        const SizedBox(
          width: 5,
        ),
        Card(
          color: Colors.white,
          elevation: 4,
          child: Container(
              height: 15.h,
              width: 30.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(32))),
              child: Row(
                children: [
                  Image.asset(
                    'assets/watch.png',
                    height: 40,
                    width: 40,
                  ),
                  const Text(
                    'Watch',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              )),
        ),
        Card(
          color: Colors.white,
          elevation: 4,
          child: Container(
              height: 15.h,
              width: 30.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(32))),
              child: Row(
                children: [
                  Image.asset(
                    'assets/jacket.png',
                    height: 40,
                    width: 40,
                  ),
                  const Text(
                    'Jacket',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
