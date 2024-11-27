import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    super.key,
    this.url,
    this.imgPath,
    required this.isFromNetwork,
  });

  final String? url;
  final String? imgPath;
  final bool isFromNetwork;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          isFromNetwork == false
              ? Image.asset(
                  imgPath!,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black.withOpacity(0.5),
                )
              : Image.network(
                  width: MediaQuery.sizeOf(context).width,
                  url!,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black.withOpacity(0.5),
                ),
          // showCaption == true
          //     ? Align(
          //         alignment: Alignment.center,
          //         child: Text(
          //           (showCaption == true && isFromNetwork == true)
          //               ? 'Image From Network'
          //               : 'Image From Assets',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //             fontStyle: FontStyle.italic,
          //             letterSpacing: 2,
          //           ),
          //         ),
          //       )
          //     : SizedBox.shrink(),
        ],
      ),
    );
  }
}
