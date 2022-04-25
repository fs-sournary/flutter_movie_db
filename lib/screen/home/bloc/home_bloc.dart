import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_db/model/movie_category_type.dart';
import 'package:flutter_movie_db/model/tv_category_type.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeMovieCategoryChanged>(_onHomeMovieCategoryChanged);
    on<HomeTelevisionCategoryChanged>(_onHomeTelevisionCategoryChanged);
    on<HomeIndexChanged>(_onHomeIndexChanged);
  }

  void _onHomeMovieCategoryChanged(
    HomeMovieCategoryChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(movieType: event.type));
  }

  void _onHomeTelevisionCategoryChanged(
    HomeTelevisionCategoryChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(tvType: event.type));
  }

  void _onHomeIndexChanged(HomeIndexChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }
}
