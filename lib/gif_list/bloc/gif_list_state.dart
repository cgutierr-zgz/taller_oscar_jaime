part of 'gif_list_bloc.dart';

@immutable
abstract class GifListState extends Equatable {
  const GifListState();

  @override
  List<Object?> get props => [];

  dynamic when({
    required dynamic Function() initial,
    required dynamic Function() loading,
    required dynamic Function(List<Gif>) loaded,
    required dynamic Function() error,
  }) {
    if (this is GifListInitial) {
      return initial();
    } else if (this is GifListLoading) {
      return loading();
    } else if (this is GifListSucceed) {
      return loaded((this as GifListSucceed).gifs);
    } else if (this is GifListFailed) {
      return error();
    } else {
      throw Exception('Unknown state: $this');
    }
  }
}

class GifListInitial extends GifListState {
  const GifListInitial();
}

class GifListLoading extends GifListState {
  const GifListLoading();
}

class GifListSucceed extends GifListState {
  const GifListSucceed(this.gifs);

  final List<Gif> gifs;

  @override
  List<Object?> get props => [gifs];
}

class GifListFailed extends GifListState {
  const GifListFailed();
}
