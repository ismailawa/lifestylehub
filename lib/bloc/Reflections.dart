import 'dart:async';

import 'package:life_style_hub/model/Reflection.dart';
import 'package:life_style_hub/providers/repository.dart';
import 'package:rxdart/rxdart.dart';

class ReflectionBloc {
  final Repository _repository;

  ReflectionBloc(this._repository);

  final _reflectionListGetter = BehaviorSubject<List<Reflection>>();
  Stream<List<Reflection>> get reflectionList => _reflectionListGetter.stream;
  var reflectionIdsList = List<int>();

  getReflectionList() async {
    //print("bloc here");
    var response = await _repository.getReflectionListDB();
    await getReflectionsInternet(response);
  }

  getReflectionsInternet(List<Reflection> dblist) async {
    //print("db here");
    dblist.forEach((reflection) {
      reflectionIdsList.add(reflection.id);
    });

    var dataList = List<Reflection>();
    dataList.addAll(dblist);
    var response = await _repository.getReflectionList();

    if (response.isConnectionSuccessful()) {
      //print("connection successful");
      if (!response.isRequestSuccessful()) {
        //_reflectionListGetter.addError(response.message);
        //print("data size: ${dataList.length}");
        if (dataList.isNotEmpty) _reflectionListGetter.sink.add(dataList);
      } else {
        var reflectionListx = response.list;
        for (int x = 0; x < reflectionListx.length; x++) {
          if (!reflectionIdsList.contains(reflectionListx[x].id))
            dataList.add(reflectionListx[x]);
        }
        _reflectionListGetter.sink.add(dataList);
        if (reflectionListx.isNotEmpty)
          reflectionListx.forEach((reflection) async =>
              await _repository.manageReflection(reflection));
      }
    } else {
      _reflectionListGetter.sink.addError(response.formattedErrMessage);
      if (dataList.isNotEmpty) _reflectionListGetter.sink.add(dataList);
    }
  }

  void dispose() {
    _reflectionListGetter.close();
  }
}
