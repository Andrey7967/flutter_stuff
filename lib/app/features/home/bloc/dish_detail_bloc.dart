import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/repositories/content/content_repository_interface.dart';
import '../../../../domain/repositories/content/model/content.dart';

abstract class DishDetailEvent extends Equatable {
  const DishDetailEvent();
  @override
  List<Object?> get props => [];
}

class DishDetailLoad extends DishDetailEvent {
  final int id;
  const DishDetailLoad(this.id);

  @override
  List<Object?> get props => [id];
}

abstract class DishDetailState extends Equatable {
  const DishDetailState();
  @override
  List<Object?> get props => [];
}

class DishDetailInitial extends DishDetailState {}

class DishDetailLoadInProgress extends DishDetailState {}

class DishDetailLoadSuccess extends DishDetailState {
  final Content dish;
  const DishDetailLoadSuccess(this.dish);

  @override
  List<Object?> get props => [dish];
}

class DishDetailLoadFailure extends DishDetailState {
  final Object exception;
  const DishDetailLoadFailure(this.exception);

  @override
  List<Object?> get props => [exception];
}

class DishDetailBloc extends Bloc<DishDetailEvent, DishDetailState> {
  final ContentRepositoryInterface repository;

  DishDetailBloc(this.repository) : super(DishDetailInitial()) {
    on<DishDetailLoad>(_onLoad);
  }

  Future<void> _onLoad(
    DishDetailLoad event,
    Emitter<DishDetailState> emit,
  ) async {
    emit(DishDetailLoadInProgress());
    try {
      final dish = await repository.getContentById(event.id);
      emit(DishDetailLoadSuccess(dish));
    } catch (e) {
      emit(DishDetailLoadFailure(e));
    }
  }
}
