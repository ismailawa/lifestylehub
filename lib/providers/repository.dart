import 'package:life_style_hub/providers/api_provider.dart';
import 'package:life_style_hub/responses/responses.dart';
import 'dart:io';
import 'package:life_style_hub/storage/database.dart';
import 'package:life_style_hub/model/model.dart';
import 'package:life_style_hub/storage/session.dart';

class Repository {
  final ApiProvider _apiProvider;
  final DatabaseManager _databaseManager = DatabaseManager();
  final SessionManager _sessionManager = SessionManager();

  Repository(this._apiProvider);

  /* from api_provider */
  Future<DefaultResponse> login(String email, String password) async =>
      _apiProvider.login(email, password);
  Future<DefaultResponse> register(User userObj) async =>
      _apiProvider.register(userObj);
  Future<ReflectionGetApiResponse> getReflectionList() async =>
      _apiProvider.getReflectionList();

  /* from database */
  Future<bool> isReflection(Reflection reflection) async =>
      _databaseManager.isReflection(reflection);
  Future<int> manageReflection(Reflection reflection) async =>
      _databaseManager.manageReflection(reflection);
  Future<List<Reflection>> getReflectionListDB() async =>
      _databaseManager.getReflectionList();
  Future<bool> isTodo(Task task) async => _databaseManager.isTodo(task);
  Future<bool> isTodoExist(Task task) async =>
      _databaseManager.isTodoExist(task);
  Future<List<Task>> getTodoList() async => _databaseManager.getTodoList();
  Future<List<Task>> getTodoListByPriority() async =>
      _databaseManager.getTodoListByPriority();
  Future<int> manageTodo(Task task) async => _databaseManager.manageTodo(task);
  Future<int> deleteTodo(Task task) async => _databaseManager.deleteTodo(task);
  Future<bool> isReminder(Task task) async => _databaseManager.isReminder(task);
  Future<List<Task>> getReminderList() async =>
      _databaseManager.getReminderList();
  Future<int> manageReminder(Task task) async =>
      _databaseManager.manageReminder(task);
  Future<int> deleteReminder(Task task) async =>
      _databaseManager.deleteReminder(task);

  /* from sessions */
  Future<bool> isActivityLaunch(String key) async =>
      _sessionManager.isActivityLaunch(key);
  Future<void> setActivityLaunch(String key, bool value) async =>
      _sessionManager.setActivityLaunch(key, value);
  Future<String> getString(String key) async => _sessionManager.getString(key);
  Future<void> setString(String key, String value) async =>
      _sessionManager.setString(key, value);
  Future<void> setEmail(String value) async => _sessionManager.setEmail(value);
  Future<String> getEmail() async => _sessionManager.getEmail();
  Future<bool> isEmail() async => _sessionManager.isEmail();
  Future<void> setLogin(bool value) async => _sessionManager.setLogin(value);
  Future<bool> isLogin() async => _sessionManager.isLogin();
  Future<void> setName(String value) async => _sessionManager.setName(value);
  Future<String> getName() async => _sessionManager.getName();
  Future<void> setToken(String value) async => _sessionManager.setToken(value);
  Future<String> getToken() async => _sessionManager.getToken();
  Future<void> clear() async => _sessionManager.clear();
  Future<void> removeAll() async => _sessionManager.removeAll();
}
