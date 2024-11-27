import 'package:flutter/material.dart';
import 'package:flutter_latihan/components/my_image.dart';

class AboutScreen extends StatelessWidget {
  final String title;

  const AboutScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        // Icon agar di kanan
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(
        //       Icons.arrow_forward_ios,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyImage(
              url: "https://picsum.photos/id/10/500/500",
              isFromNetwork: true,
            ),
            // MyImage(
            //   imgPath: 'assets/images/w16.jpg',
            //   isFromNetwork: false,
            // )

            // Row 1
            firstRowWidget(),

            // Row 2
            secondRowWidget(),

            Container(
              height: 200,
              margin: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  'Flutter Course',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  firstRowWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          for (int i = 0; i < 5; i++)
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              width: 100,
              height: 100,
              // child: MyImage(
              //   imgPath: 'assets/images/w16.jpg',
              //   isFromNetwork: false,
              //   showCaption: false,
              // ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: MyImage(
                      url: "https://picsum.photos/id/3$i/500/500",
                      isFromNetwork: true,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  secondRowWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          for (int i = 0; i < 5; i++)
            Container(
              color: Colors.grey,
              margin: const EdgeInsets.only(right: 10.0),
              width: 100,
              height: 100,
              // child: MyImage(
              //   imgPath: 'assets/images/w16.jpg',
              //   isFromNetwork: false,
              //   showCaption: false,
              // ),
              child: Stack(
                children: [
                  MyImage(
                    url: "https://picsum.photos/id/4$i/500/500",
                    isFromNetwork: true,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
