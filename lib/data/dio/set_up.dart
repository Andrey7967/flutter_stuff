import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

final Dio dio = Dio();

void setUpDio() {
  dio.options.baseUrl = 'https://flutter-essen-backend.onrender.com';

  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 5);

  dio.interceptors.add(
    TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestData: true,
        printRequestHeaders: true,
      ),
    ),
  );
}
