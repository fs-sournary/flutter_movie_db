part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeMovieCategoryChanged extends HomeEvent {
  const HomeMovieCategoryChanged(this.type);

  final MovieCategoryType type;

  @override
  List<Object> get props => [type];
}

class HomeTelevisionCategoryChanged extends HomeEvent {
  const HomeTelevisionCategoryChanged(this.type);

  final TvCategoryType type;

  @override
  List<Object> get props => [type];
}

class HomeIndexChanged extends HomeEvent {
  const HomeIndexChanged(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}
