import 'package:cleanapp/core/error/faliure.dart';
import 'package:cleanapp/core/usecase/base_usecase.dart';
import 'package:cleanapp/movies/domain/entities/movie.dart';
import 'package:cleanapp/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure,List<Movie>>>  call(NoParameters parameters)async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}