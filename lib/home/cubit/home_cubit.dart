import 'package:bloc/bloc.dart';
import 'package:gif_repository/gif_repository.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.gifRepository) : super(HomeState());
  final GifRepository gifRepository;

  Future<void> getData() async {
    try {
      final gifUrls = await gifRepository.getUrls();
      emit(state.copyWith(status: RequestStatus.succes, gifs: gifUrls));
    } catch (e) {
      emit(state.copyWith(status: RequestStatus.error));
    }
  }
}
