import 'package:cleanapp/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.id, required super.title, required super.backdroppath, required super.genreids, required super.overview, required super.voteAverage, required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json)=>
      MovieModel(id:json['id'],
          title:json['title'],
          backdroppath:json['backdrop_path'],
          genreids:List<int>.from(json['genre_ids'].map((e) => e)) ,
          overview:json['overview'],
          voteAverage:json['vote_average'].toDouble(),
          releaseDate:json['release_date'],);


}