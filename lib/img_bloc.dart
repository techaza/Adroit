import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'img_event.dart';

part 'img_state.dart';

class ImgBloc extends Bloc<ImgEvent, ImgState> {
  ImgBloc() : super(Loading()) {
    on<FetchApi>((event, emit) async {
      // TODO: implement event handler
      var linkurl =
          await Dio().get('https://jsonplaceholder.typicode.com/photos');
      var ak = List<Images>.from((linkurl.data).map((x) => Images.fromJson(x)));
      print(linkurl.data);


      var link2url =
      await Dio().get('https://jsonplaceholder.typicode.com/users');
      var ak2 =List<Usr>.from((link2url.data).map((x) => Usr.fromJson(x)));
      print(link2url.data);

      emit(Loaded(data: ak,data1: ak2));
    });
  }
}
