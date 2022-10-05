import 'package:cleanapp/core/error/exceptions.dart';
import 'package:cleanapp/core/error/faliure.dart';
import 'package:cleanapp/movies/data/datasource/movie_remote_data_source.dart';
import 'package:cleanapp/movies/domain/entities/movie.dart';
import 'package:cleanapp/movies/domain/entities/movie_detail.dart';
import 'package:cleanapp/movies/domain/entities/recommendation.dart';
import 'package:cleanapp/movies/domain/repository/base_movies_repository.dart';
import 'package:cleanapp/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:cleanapp/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:dartz/dartz.dart';

class MoviesRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies()  async {
final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
//هنا الناتيجه الى راجعه من api ي هتكون ModelMovie او هتكون Exception
  try{
    return Right(result);
  }on ServerException catch(failure){
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  }

  }

  @override
  Future<Either<Failure,List<Movie>>>getPopularMovies() async{
    final result= await baseMovieRemoteDataSource.getPopularMovies();
//هنا الناتيجه الى راجعه من api ي هتكون ModelMovie او هتكون Exception
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovies() async{
    final result= await baseMovieRemoteDataSource.getTopRatedMovies();
//هنا الناتيجه الى راجعه من api ي هتكون ModelMovie او هتكون Exception
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(MovieDetailsParameters parameters)async {
    final result= await baseMovieRemoteDataSource.getMovieDetails(parameters);
//هنا الناتيجه الى راجعه من api ي هتكون ModelMovie او هتكون Exception
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
    final result= await baseMovieRemoteDataSource.getRecommendation(parameters);
//هنا الناتيجه الى راجعه من api ي هتكون ModelMovie او هتكون Exception
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}