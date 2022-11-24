import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example_giphy/gif_list/domain/gif.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'gif_list_event.dart';
part 'gif_list_state.dart';

class GifListBloc extends Bloc<GifListEvent, GifListState> {
  GifListBloc() : super(const GifListInitial()) {
    const apiKey = '5U571jBa3vGONCb0Rjo2qEAk2xGSwSDa';

    on<GifListSearched>((event, emit) async {
      emit(const GifListLoading());

      // TODO: Refactor this to use a repository
      final url = 'https://api.giphy.com/v1/gifs/search?api_key=$apiKey&limit=25&rating=g&lang=en&q=${event.query}';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        emit(GifListSucceed((jsonDecode(response.body)['data'] as List).map((e) => Gif.fromJson(e)).toList()));
      } else {
        emit(const GifListFailed());
      }

//      DefaultCacheManager
    });
  }
}
