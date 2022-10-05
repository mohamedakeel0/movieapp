import 'package:cleanapp/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation{
 const RecommendationModel({ super.backdroppath,required super.id});

 factory RecommendationModel.fromJson(Map<String, dynamic> json)=>
     RecommendationModel(
       backdroppath:json['backdrop_path'] ??'/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg',
       id:json['id'],
   );
}