import 'package:equatable/equatable.dart';

class Recommendation extends Equatable{
  final String? backdroppath;
  final int id;
const  Recommendation({ this.backdroppath,required this.id});

  @override
  List<Object?> get props => [backdroppath,id];

}