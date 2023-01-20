part of 'home_cubit.dart';

enum RequestStatus { loading, succes, error }

class HomeState {
  HomeState(
      {this.status = RequestStatus.loading, this.gifs = const <GifModel>[]});
  final RequestStatus status;
  final List<GifModel> gifs;

  HomeState copyWith({RequestStatus? status, List<GifModel>? gifs}) {
    return HomeState(status: status ?? this.status, gifs: gifs ?? this.gifs);
  }
}
