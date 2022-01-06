import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_loading/blocs/images_bloc.dart';
import 'package:image_loading/extras/constants.dart';
import 'package:image_loading/models/images_item.dart';
import 'package:image_loading/widgets/image_list_item.dart';
import 'package:loadmore/loadmore.dart';

import 'image_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImagesBloc imagesBloc = BlocProvider.of<ImagesBloc>(context);
    imagesBloc.add(GetImagesEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Images"),
      ),
      body: BlocBuilder<ImagesBloc, ImagesState>(
        builder: (context, state) {
          if (state is GetImagesDone) {
            if (state.data.status && state.data.data != null) {
              ImagesItem item = ImagesItem.fromJson(state.data.data!);
              return LoadMore(
                isFinish: false,
                onLoadMore: () async {
                  return true;
                },
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      String url = item.results[index];
                      return ImageListItem(
                        url: url,
                        index: index,
                        onImageClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return const ImageView();
                                  },
                                  settings: RouteSettings(
                                    arguments: {"index": index, "url": url},
                                  )));
                        },
                      );
                    },
                    itemCount: item.results.length),
              );
            } else {
              return Center(
                child: "No data found.".noDataText(),
              );
            }
          }
          return Visibility(
            visible: state is ImagesInitial,
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
