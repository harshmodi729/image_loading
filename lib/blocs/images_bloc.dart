import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_loading/extras/constants.dart';
import 'package:image_loading/network/base_api_helper.dart';
import 'package:image_loading/network/response_item.dart';

part 'images_event.dart';

part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(ImagesInitial());

  @override
  Stream<ImagesState> mapEventToState(ImagesEvent event) async* {
    ResponseItem result =
        ResponseItem(data: null, message: errorText, status: false);
    if (event is GetImagesEvent) {
      try {
        yield ImagesInitial();

        result = await BaseApiHelper.postRequest(baseUrl, {});
        yield GetImagesDone(result);
      } catch (exception) {
        yield GetImagesDone(result);
      }
    }
  }
}
