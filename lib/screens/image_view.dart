import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image View"),
      ),
      body: Stack(
        children: [
          FadeInImage.assetNetwork(
            image: argument["url"],
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
            placeholder: "assets/ic_placeholder.png",
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.black38),
              child: Center(
                child: Text(
                  "${argument["index"]}",
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
