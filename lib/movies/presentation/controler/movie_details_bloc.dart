import 'dart:async';

import 'package:cleanapp/core/utils/enums.dart';
import 'package:cleanapp/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:cleanapp/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:cleanapp/movies/presentation/controler/movie_details_event.dart';
import 'package:cleanapp/movies/presentation/controler/movie_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent,MovieDetailsState>{
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase  getRecommendationUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getRecommendationUseCase):super(const MovieDetailsState()){
  on<GetMovieDetailsEvent>(_getMovieDetails);
  on<GetMovieRecommendationEvent>(_getRecommendation);
}

FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async{
  final result =await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));

  result.fold((l) =>
      emit(state.copyWith(movieDetailsState:  RequestState.error,detailsMessage: l.message, ))
    , (r) =>
        emit(state.copyWith( movieDetail: r, movieDetailsState: RequestState.loaded)),);

  print(result);
}



  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result =await getRecommendationUseCase(RecommendationParameters( event.id));

    result.fold((l) =>
        emit(state.copyWith(recommendationState:  RequestState.error,recommendationMessage: l.message, ))
      , (r) =>
          emit(state.copyWith( recommendation: r, recommendationState: RequestState.loaded)),);

    print(result);
  }
}