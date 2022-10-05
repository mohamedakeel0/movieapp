import 'package:cleanapp/core/error/faliure.dart';
import 'package:cleanapp/core/usecase/base_usecase.dart';
import 'package:cleanapp/movies/domain/entities/movie_detail.dart';
import 'package:cleanapp/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail,MovieDetailsParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) async{
  return await baseMoviesRepository.getMovieDetail(parameters);
  }

}
class   NoParameters extends Equatable{
  const NoParameters();

  @override
  List<Object?> get props => [];

}
class MovieDetailsParameters extends Equatable{
  final int movieId;
  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}