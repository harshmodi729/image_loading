part of 'images_bloc.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();
}

class GetImagesEvent extends ImagesEvent {
  @override
  List<Object> get props => [];
}
