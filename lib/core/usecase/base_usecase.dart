import 'package:cleanapp/core/error/faliure.dart';
import 'package:cleanapp/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<T,Parameters>{
  Future<Either<Failure,T>> call(Parameters parameters);
}