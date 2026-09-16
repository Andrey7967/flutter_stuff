import 'package:dio/dio.dart';
import 'content_repository_interface.dart';
import 'model/content.dart';

class ContentRepository implements ContentRepositoryInterface {
  final Dio _dio;

  ContentRepository({required Dio dio}) : _dio = dio;

  @override
  Future<List<Content>> getContent() async {
    final response = await _dio.get('/content');
    final List data = response.data['data'];

    final baseUrl = _dio.options.baseUrl;

    return data.map((json) {
      final item = Content.fromJson(json as Map<String, dynamic>);
      final rawPath = item.image;

      final fullImageUrl = rawPath.startsWith('http')
          ? rawPath
          : '$baseUrl${rawPath.startsWith('/') ? '' : '/'}$rawPath';

      return item.copyWith(image: fullImageUrl);
    }).toList();
  }
}
