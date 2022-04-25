part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.selectedIndex = 0,
    this.movieType = MovieCategoryType.latest,
    this.tvType = TvCategoryType.latest,
  });

  final int selectedIndex;
  final MovieCategoryType movieType;
  final TvCategoryType tvType;

  HomeState copyWith({
    int? selectedIndex,
    MovieCategoryType? movieType,
    TvCategoryType? tvType,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      movieType: movieType ?? this.movieType,
      tvType: tvType ?? this.tvType,
    );
  }

  @override
  List<Object> get props => [selectedIndex, movieType, tvType];
}
