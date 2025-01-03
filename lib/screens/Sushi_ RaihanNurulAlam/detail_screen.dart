import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_latihan/models/food.dart';
import 'package:flutter_latihan/provider/cart.dart';
import 'package:flutter_latihan/screens/Sushi_%20RaihanNurulAlam/cart_screen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final Food food;

  const DetailScreen({
    super.key,
    required this.food,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int qtyCount = 0;
  int totalPrice = 0;

  void incrementQty() {
    setState(() {
      qtyCount++;
      totalPrice = qtyCount * int.parse(widget.food.price.toString());
    });
  }

  void decrementQty() {
    setState(() {
      if (qtyCount > 0) {
        qtyCount--;
        totalPrice = qtyCount * int.parse(widget.food.price.toString());
      }
    });
  }

  void addToCart() {
    if (qtyCount > 0) {
      final cart = context.read<Cart>();
      cart.addToCart(widget.food, qtyCount);
      popUpDialog();
    }
  }

  void popUpDialog() {
    setState(() {
      qtyCount = 0;
      totalPrice = 0;
    });

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      showDragHandle: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Food was added to cart',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${widget.food.name} was added to cart, would you like to add some food?',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: FloatingActionButton(
                      heroTag: 'goToCart',
                      backgroundColor: Color.fromARGB(109, 140, 94, 91),
                      elevation: 0,
                      onPressed: () {
                        Navigator.pop(context);
                        goToCart();
                      },
                      child: Text(
                        'View Cart',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: FloatingActionButton(
                      heroTag: 'pop',
                      backgroundColor: Theme.of(context).primaryColor,
                      elevation: 0,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sure',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void goToCart() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        goToCart();
                      },
                      icon: Icon(
                        CupertinoIcons.bag,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Visibility(
                        visible: value.cart.isNotEmpty ? true : false,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.yellow,
                          child: Center(
                            child: Text(
                              value.cart.length.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: foodDetailWidget(context),
      bottomNavigationBar: qtyCount == 0
          ? null
          : GestureDetector(
              onTap: () {
                addToCart();
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Rp. $totalPrice',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 10),
      //   color: Colors.redAccent,
      //   height: 70,
      //   width: MediaQuery.sizeOf(context).width,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       FloatingActionButton(
      //         heroTag: 'q',
      //         backgroundColor: const Color.fromARGB(109, 140, 94, 91),
      //         elevation: 0,
      //         onPressed: () {
      //           incrementQty();
      //         },
      //         child: const Icon(
      //           Icons.add,
      //           color: Colors.white,
      //         ),
      //       ),
      //       FloatingActionButton(
      //         heroTag: 'w',
      //         backgroundColor: Colors.transparent,
      //         elevation: 0,
      //         onPressed: () {},
      //         child: Text(
      //           qtyCount.toString(),
      //           style: const TextStyle(
      //             fontSize: 18,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //       FloatingActionButton(
      //         heroTag: 'q',
      //         backgroundColor: const Color.fromARGB(109, 140, 94, 91),
      //         elevation: 0,
      //         onPressed: () {
      //           decrementQty();
      //         },
      //         child: const Icon(
      //           Icons.remove,
      //           color: Colors.white,
      //         ),
      //       ),
      //       const SizedBox(width: 10),
      //       Expanded(
      //         child: FloatingActionButton(
      //           heroTag: 't',
      //           backgroundColor: const Color.fromARGB(109, 140, 94, 91),
      //           elevation: 0,
      //           onPressed: () {},
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 12),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: const [
      //                 Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       'IDR ',
      //                       style: TextStyle(
      //                         fontSize: 12,
      //                         color: Colors.white,
      //                       ),
      //                     ),
      //                     Text(
      //                       'Add to Cart',
      //                       style: TextStyle(
      //                         fontSize: 18,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Icon(
      //                   Icons.arrow_forward,
      //                   color: Colors.white,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  foodDetailWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.food.imagePath.toString(),
            child: Container(
              height: 300,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.food.imagePath.toString()),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.food.name.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${widget.food.price} IDR',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 38,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          size: 14,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 5),
                        Text(
                          widget.food.rating.toString(),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 49, 26, 26),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // Icon Favorite
                // Icon(
                //   CupertinoIcons.heart,
                //   size: 34,
                //   color: Colors.red,
                // ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        decrementQty();
                      },
                      icon: Icon(
                        CupertinoIcons.minus,
                        size: 34,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      qtyCount.toString(),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 49, 26, 26),
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    IconButton(
                      onPressed: () {
                        incrementQty();
                      },
                      icon: Icon(
                        CupertinoIcons.plus,
                        size: 34,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.food.description.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
