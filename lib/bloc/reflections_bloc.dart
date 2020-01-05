import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:life_style_hub/providers/repository.dart';
import './bloc.dart';

class ReflectionsBloc extends Bloc<ReflectionsEvent, ReflectionsState> {
  final Repository repository;

  ReflectionsBloc({this.repository});

  @override
  ReflectionsState get initialState => Empty();

  @override
  Stream<ReflectionsState> mapEventToState(
    ReflectionsEvent event,
  ) async* {
    if (event is GetReflectionsEvent) {
      yield Loading();
      final result = await repository.getReflectionList();
      if (result.statusCode == 200) {
        yield Loaded(reflections: result.list);
      } else {
        yield Error(message: result.message);
      }
    }
  }
}
