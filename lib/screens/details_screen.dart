// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';

import '../data.dart';
import '/my_colors.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  //
  int rotationCount = 22; // 22 images
  int swipeSensitivity = 2; // range 1 -5
  bool autoRotate = false;
  bool imagePrecached = true;
  bool allowSwipeToRotate = true;
  List<ImageProvider> imageList = <ImageProvider>[];

  void updateImageList(BuildContext context) {
    for (int i = 1; i <= 21; i++) {
      imageList.add(AssetImage('assets/s$i.png'));
    }
  }

  @override
  void initState() {
    super.initState();
    updateImageList(context);
  }

  // buildColorWidgets
  List<Widget> buildColorWidgets() {
    return Data.generateCategories()
        .map(
          (e) => Container(
            padding: const EdgeInsets.only(left: 5, bottom: 10, top: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: e.id == 1 ? MyColors.myOrange : Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  e.image,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    //
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Men\'s Shoes',
          style: TextStyle(color: MyColors.myOrange),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [Image.asset('assets/ic_search.png')],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: size.width - 30,
                child: Stack(
                  children: [
                    // Image
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 70),
                        child: Image.asset('assets/ring.png'),
                      ),
                    ),
                    // Rotation image 360
                    ImageView360(
                      key: UniqueKey(),
                      imageList: imageList,
                      autoRotate: autoRotate,
                      rotationCount: rotationCount,
                      swipeSensitivity: swipeSensitivity,
                      allowSwipeToRotate: allowSwipeToRotate,
                      onImageIndexChanged: (currentImageIndex) {
                        print('currentImageIndex: $currentImageIndex');
                      },
                    ),
                  ],
                ),
              ),
              //
              Container(
                width: size.width,
                decoration: const BoxDecoration(
                  color: MyColors.grayBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text - Name Products
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          text: 'Nike Air Max Pre-Day',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          // Text - Vote
                          RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                              text: '5.0',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          // Text - nuber reviews
                          RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                              text: '1125 Reviews',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Text - description products
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          text:
                              'Men\'s sneakers are made with leather upper features for durability and support, while perforations provide airflow during every shoe wear.',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Text - Select color
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          text: 'Select Color:',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // buildColorWidgets
                      SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: buildColorWidgets(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
