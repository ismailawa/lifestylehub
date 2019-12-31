import 'package:life_style_hub/model/Task.dart';
import 'package:life_style_hub/providers/repository.dart';
import 'package:rxdart/rxdart.dart';

class ReminderBloc {
  final Repository _repository;

  ReminderBloc(this._repository);

  final _todoListGetter = BehaviorSubject<List<Task>>();
  Stream<List<Task>> get todoList => _todoListGetter.stream;

  getReminderList() async {
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
    _repository.getTodoList();
  }

  deleteTodo(Task task) async {
    await _repository.deleteTodo(task);
    _repository.getTodoList();
  }

  void dispose() {
    _todoListGetter.close();
  }
}
