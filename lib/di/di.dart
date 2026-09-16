import 'package:get_it/get_it.dart';
import '../data/dio/set_up.dart';
import '../domain/repositories/content/content_repository.dart';
import '../domain/repositories/content/content_repository_interface.dart';
import '../app/features/home/bloc/home_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt = GetIt.instance;
final talker = Talker();
Future<void> setupLocator() async {
  setUpDio();

  getIt.registerSingleton<ContentRepositoryInterface>(
    ContentRepository(dio: dio),
  );

  getIt.registerSingleton(
    HomeBloc(getIt.get<ContentRepositoryInterface>()),
  );
}
