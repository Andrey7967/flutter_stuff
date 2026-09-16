import 'package:flutter/material.dart';
import 'package:flutter_applab_1/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/di.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _home = getIt<HomeBloc>();

  void loadHome() => _home.add(const HomeLoad());

  @override
  void initState() {
    loadHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _home,
        builder: (context, state) {
          return switch (state) {
            HomeInitial() => _buildHomeInitial(),
            HomeLoadInProgress() => _buildHomeLoadInProgress(),
            HomeLoadSuccess() => _buildHomeLoadSuccess(state),
            HomeLoadFailure() => _buildHomeLoadFailure(state),
          };
        },
      ),
    );
  }

  Widget _buildHomeInitial() => const SizedBox.shrink();

  Widget _buildHomeLoadInProgress() =>
      const Center(child: CircularProgressIndicator());

  Widget _buildHomeLoadSuccess(HomeLoadSuccess state) {
    final content = state.content;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Меню',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          20.ph,
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: content.length,
            itemBuilder: (_, index) => Card(
              child: ListTile(
                title: Text(content[index].title),
                subtitle: Text(content[index].description),
                leading: Image.network(
                  content[index].image,
                  errorBuilder: (_, __, ___) => const Icon(Icons.fastfood),
                ),
              ),
            ),
            separatorBuilder: (_, __) => 16.ph,
          ),
        ],
      ),
    );
  }

  Widget _buildHomeLoadFailure(HomeLoadFailure state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ошибка загрузки: ${state.exception}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => loadHome(),
            child: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}
