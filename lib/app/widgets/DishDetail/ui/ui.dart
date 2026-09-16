import 'package:flutter/material.dart';
import 'package:flutter_applab_1/app/extensions/widget_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/di.dart';
import '../../../../domain/repositories/content/model/content.dart';
import '../../GlassBackButton/ui/ui.dart';
import '../../../features/home/bloc/dish_detail_bloc.dart';

class DishDetailScreen extends StatefulWidget {
  final int dishId;
  final Content? initialDish;

  const DishDetailScreen({
    super.key,
    required this.dishId,
    this.initialDish,
  });

  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {
  late final DishDetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = DishDetailBloc(getIt.get());
    _bloc.add(DishDetailLoad(widget.dishId));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishDetailBloc, DishDetailState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is DishDetailLoadInProgress && widget.initialDish == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is DishDetailLoadFailure && widget.initialDish == null) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ошибка загрузки: ${state.exception}'),
                  16.ph,
                  ElevatedButton(
                    onPressed: () => _bloc.add(DishDetailLoad(widget.dishId)),
                    child: const Text('Повторить'),
                  ),
                ],
              ),
            ),
          );
        }

        final dish =
            state is DishDetailLoadSuccess ? state.dish : widget.initialDish;

        if (dish == null) {
          return const Scaffold(body: SizedBox.shrink());
        }

        return _buildContent(context, dish);
      },
    );
  }

  Widget _buildContent(BuildContext context, Content dish) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: GlassBackButton(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                dish.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.fastfood,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          dish.title,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      12.ph,
                      Text(
                        dish.formattedPrice,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  if (dish.calories != null) ...[
                    16.ph,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            size: 18,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          6.ph,
                          Text(
                            '${dish.calories} ккал',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  24.ph,
                  Text(
                    'Описание',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.ph,
                  Text(
                    dish.description,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${dish.title} добавлено в заказ!')),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Добавить в заказ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
