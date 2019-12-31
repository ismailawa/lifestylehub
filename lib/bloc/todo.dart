import 'package:life_style_hub/model/Task.dart';
import 'package:life_style_hub/providers/repository.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc {
  final Repository _repository;

  TodoBloc(this._repository);

  final _todoListGetter = BehaviorSubject<List<Task>>();
  Stream<List<Task>> get todoList => _todoListGetter.stream;

  getTodoList() async {
    //print("bloc here");
    var response = await _repository.getTodoList();
    if (response.isNotEmpty) _todoListGetter.sink.add(response);
  }

  getTodoListByPriority() async {
    //print("bloc here");
    var response = await _repository.getTodoList();
    if (response.isNotEmpty) _todoListGetter.sink.add(response);
  }

  manageTodo(Task task) async {
    await _repository.manageTodo(task);
    getTodoList();
  }

  deleteTodo(Task task) async {
    await _repository.deleteTodo(task);
    getTodoList();
  }

  void dispose() {
    _todoListGetter.close();
  }
}
