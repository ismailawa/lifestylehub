import 'package:equatable/equatable.dart';
import 'package:life_style_hub/model/model.dart';

abstract class ReflectionsState extends Equatable {
  const ReflectionsState();
}

class Empty extends ReflectionsState {
  @override
  List<Object> get props => [];
}

class Loaded extends ReflectionsState {
  final List<Reflection> reflections;

  const Loaded({this.reflections});

  @override
  List<Object> get props => [reflections];
}

class Loading extends ReflectionsState {
  @override
  List<Object> get props => [];
}

class Error extends ReflectionsState {
  final String message;

  Error({this.message});

  @override
  List<Object> get props => [message];
}
