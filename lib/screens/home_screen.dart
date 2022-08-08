import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '/data.dart';
import '/my_colors.dart';
import '/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  List<Widget> buildCategories() {
    return Data.generateCategories()
        .map(
          (e) => Container(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    e.id == 1 ? Colors.white : Colors.black38),
                backgroundColor: MaterialStateProperty.all(
                    e.id == 1 ? MyColors.myOrange : Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: MyColors.grayBackground,
                      child: Image.asset(
                        e.image,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    e.title,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset('assets/ic_menu.png'),
          onPressed: () {},
        ),
        actions: [Image.asset('assets/ic_search.png')],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Stack(
              children: [
                // Image Banner Nike
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/img_banner.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text - New release
                      RichText(
                        text: const TextSpan(
                          text: 'New Release',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Text Prodcuts
                      RichText(
                        text: const TextSpan(
                          text: 'Nike Air\nMax 90',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Button Text
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all(MyColors.myBlack),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: Text('Buy now'.toUpperCase()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // buildCategories
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: buildCategories(),
            ),
          ),

          const SizedBox(height: 10),

          // Text - New men's
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(
                text: 'New Men\'s',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Product description
          GridView.count(
            padding: const EdgeInsets.all(5),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            children: Data.generateProducts()
                .map(
                  (e) => Card(
                    elevation: 0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const DetailsScreen(),
                            type: PageTransitionType.leftToRight,
                          ),
                        );
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Images products
                            Image.asset(
                              e.image,
                              height: 90,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 5),
                            // Text - Type of products
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: e.type,
                                style: const TextStyle(
                                  color: MyColors.myOrange,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Text - Title of products
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: e.title,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                // Text Price
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text: '\$ ${e.price}',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                // Button Add
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black87),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),

      //
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 4.0,
        backgroundColor: MyColors.myOrange,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: const Icon(Icons.home_outlined, color: Colors.white),
        ),
      ),

      //
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 60),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/ic_shop.png')),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/ic_wishlist.png')),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/ic_notif.png')),
            const SizedBox(width: 0),
          ],
        ),
      ),
    );
  }
}
