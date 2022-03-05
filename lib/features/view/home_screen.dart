import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:rakibuddin560p/config/themes/colors.dart';
import 'package:rakibuddin560p/config/themes/theme.dart';
import 'package:rakibuddin560p/features/controller/product_controller.dart';
import 'package:rakibuddin560p/features/view/product_list.dart';
import 'package:sizer/sizer.dart';
import 'package:rakibuddin560p/shared_components/widget/extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController productController = Get.put(ProductController());
  bool isHomePageSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _appBarWidget(),
              _searchWidget(),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Daily Deals',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              _categoryWidget(),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Popular Categories',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              _productWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home_filled,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 48.0),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.keyboard_voice),
        onPressed: () {},
      ),
    );
  }

  Widget _searchWidget() {
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
                    hintText: "Search product you wish....",
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

  Widget _appBarWidget() {
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
                    color: Color.fromARGB(255, 255, 254, 254),
                    blurRadius: 10,
                    spreadRadius: 10),
              ],
            ),
            child: Column(
              children: const [
                Text('Good Morning'),
                Text('Nicholas'),
              ],
            ),
          ).ripple(() {},
              borderRadius: const BorderRadius.all(Radius.circular(13))),
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = ConstandColor.iconColor}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: const BorderRadius.all(Radius.circular(13)));
  }

  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }

  Widget _categoryWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: AppTheme.fullWidth(context),
      height: 30.h,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        Card(
          color: Colors.white,
          elevation: 4,
          child: Container(
            height: 20.h,
            width: 60.w,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Stack(children: [
              Positioned(
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 5, right: 5),
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child: const Text(
                      '-15%',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  )),
              Positioned(child: Image.asset('assets/mobile.png')),
              Positioned(
                  bottom: 0,
                  left: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    width: 60.w,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 189, 214, 212)
                                          .withOpacity(.2),
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              width: 35.w,
                              height: 6.h,
                              child: Row(children: const [
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'Add to cart',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ]),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              width: 15.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 241, 158, 158)
                                          .withOpacity(.4),
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              child: const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        const Text(
                          'OnePlus Nord CE 2 5G',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              '\$577.00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '\$1000',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ]),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Card(
          color: Colors.white,
          elevation: 4,
          child: Container(
            height: 20.h,
            width: 60.w,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Stack(children: [
              Positioned(
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 3, bottom: 3, left: 5, right: 5),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 54, 244, 231),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child: const Text(
                      'Top',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  )),
              Positioned(child: Image.asset('assets/mobile_2.png')),
              Positioned(
                  bottom: 0,
                  left: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    width: 60.w,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 189, 214, 212)
                                          .withOpacity(.2),
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              width: 35.w,
                              height: 6.h,
                              child: Row(children: const [
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.blue,
                                ),
                                Text(
                                  'Add to cart',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ]),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              width: 15.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 241, 158, 158)
                                          .withOpacity(.4),
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              child: const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        const Text(
                          'Apple iPhone 11',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              '\$899.00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '\$1000',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ]),
          ),
        ),
      ]),
    );
  }

  Widget _productWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: AppTheme.fullWidth(context),
      height: 20.h,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductListScreen('men')));
          },
          child: Card(
            color: Colors.white,
            elevation: 4,
            child: Container(
              height: 20.h,
              width: 60.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Stack(children: [
                Positioned(
                    child: Image.asset(
                  'assets/men.jpg',
                  fit: BoxFit.fitWidth,
                )),
                const Positioned(
                    top: 40,
                    left: 20,
                    child: Text(
                      'Men\'s clothing',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
              ]),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductListScreen('women')));
          },
          child: Card(
            color: Colors.white,
            elevation: 4,
            child: Container(
              height: 20.h,
              width: 60.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Stack(children: [
                Positioned(
                    child: Image.asset(
                  'assets/women.jpg',
                  fit: BoxFit.fitWidth,
                )),
                const Positioned(
                    top: 40,
                    left: 20,
                    child: Text(
                      'Women\'s clothing',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}
