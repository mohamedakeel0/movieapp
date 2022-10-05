import 'package:cleanapp/core/error/faliure.dart';
import 'package:cleanapp/movies/domain/entities/recommendation.dart';
import 'package:cleanapp/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/usecase/base_usecase.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async{
return await baseMoviesRepository.getRecommendation(parameters);
  }
}
class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];
}