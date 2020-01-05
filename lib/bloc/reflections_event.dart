import 'package:equatable/equatable.dart';

abstract class ReflectionsEvent extends Equatable {
  const ReflectionsEvent();
}

class GetReflectionsEvent extends ReflectionsEvent {
  const GetReflectionsEvent();
  @override
  List<Object> get props => [];
}
