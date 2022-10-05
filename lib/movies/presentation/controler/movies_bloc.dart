import 'dart:async';

import 'package:cleanapp/core/utils/enums.dart';

import 'package:cleanapp/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:cleanapp/movies/presentation/controler/movies_event.dart';
import 'package:cleanapp/movies/presentation/controler/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final  GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase,this.getPopularMoviesUseCase,this.getTopRatedMoviesUseCase) :super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }


  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{
    final result =await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold((l) =>
        emit(state.copyWith(nowPlayingState:  RequestState.error,nowPlayingMessage: l.message, ))
      , (r) =>
          emit(state.copyWith( nowPlayingMovies: r, nowPlayingState: RequestState.loaded)),);

    print(result);
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    final result =await getPopularMoviesUseCase(const NoParameters());

    result.fold((l) =>
        emit(state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message
        )),
            (r) =>
            emit(state.copyWith(
                popularMovies: r, popularState: RequestState.loaded
            )
            ));
    print(result);
  }

  FutureOr<void> _getTopRatedMovies(event, Emitter<MoviesState> emit)  async{
    final result =await getTopRatedMoviesUseCase(const NoParameters());

    result.fold((l) =>
        emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message
        )),
            (r) =>
            emit(state.copyWith(
                topRatedMovies: r, topRatedState: RequestState.loaded
            )
            ));
    print(result);
  }
}