import 'package:cleanapp/core/error/faliure.dart';
import 'package:cleanapp/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/base_usecase.dart';
import '../repository/base_movies_repository.dart';
import 'get_movie_details_usecase.dart';

class GetPopularMoviesUseCase  extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure,List<Movie>>>  call(NoParameters parameters)async{
    return await baseMoviesRepository.getPopularMovies();
  }
}