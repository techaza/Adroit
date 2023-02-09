part of 'img_bloc.dart';

abstract class ImgEvent extends Equatable {
  const ImgEvent();
}

class FetchApi extends ImgEvent{
  const FetchApi();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
