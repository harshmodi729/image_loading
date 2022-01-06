part of 'images_bloc.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();
}

class ImagesInitial extends ImagesState {
  @override
  List<Object> get props => [];
}

class GetImagesDone extends ImagesState {
  final ResponseItem _data;

  const GetImagesDone(this._data);

  ResponseItem get data => _data;

  @override
  List<Object> get props => [];
}

class GetImagesError extends ImagesState {
  @override
  List<Object> get props => [];
}
