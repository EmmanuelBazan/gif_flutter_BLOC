import 'package:gif_service/gif_service.dart';

import 'models/gif_model.dart';

class GifRepository {
  GifRepository({GifService? gifService})
      : _gifService = gifService ?? GifService();

  final GifService _gifService;

  Future<List<GifModel>> getUrls() async {
    final List<GifModel> urls = [];
    try {
      final listUrls = await _gifService.fetchGif();
      for (final url in listUrls) {
        urls.add(GifModel(url));
      }
      return urls;
    } catch (e) {
      throw Exception();
    }
  }
}
