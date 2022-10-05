class ApiConstance{
  static const baseUrl='https://developers.themoviedb.org/3';
  static const apiKey='c1f3631998bff8601995649df39daaf2';
  static const nowPlayingMoviesPath='$baseUrl/movie/now_playing?api_key=$apiKey&language=en-US';
  static const popularMoviesPath='$baseUrl/movie/popular?api_key=$apiKey&language=en-US';
  static const topRatedMoviesPath='$baseUrl/movie/top_rated?api_key=$apiKey&language=en-US';
  static String movieDetailsPath(movieId)=>'$baseUrl/movie/$movieId?api_key=$apiKey&language=en-US';
  static String recommendationPath(movieId)=>'$baseUrl/movie/$movieId/recommendations?api_key=$apiKey&language=en-US';
  static const baseImageUrl='https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path)=>'$baseImageUrl$path';

}