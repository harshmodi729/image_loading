import 'package:flutter/material.dart';

class ImageListItem extends StatelessWidget {
  const ImageListItem(
      {Key? key,
      required this.url,
      required this.index,
      required this.onImageClick})
      : super(key: key);

  final String url;
  final int index;
  final VoidCallback onImageClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              onImageClick();
            },
            child: Stack(
              children: [
                FadeInImage.assetNetwork(
                  image: url,
                  width: double.infinity,
                  height: 200,
                  placeholder: "assets/ic_placeholder.png",
                ),
                Positioned(
                  child: Container(
                    width: double.infinity,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Center(
                      child: Text(
                        "$index",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
